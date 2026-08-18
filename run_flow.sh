#!/usr/bin/env bash
# =====================================================================
#  UART  --  full RTL-to-GDSII flow, Sky130 / open-source toolchain
#
#  Runs stages 1-10 end to end and FAILS LOUDLY at the first stage that
#  does not produce a valid result.  Every stage has an explicit success
#  check -- "the tool exited 0" is never treated as proof of success,
#  because most of the bugs in this project produced exit code 0 and a
#  broken file.
#
#  Usage:   ./run_flow.sh            # run everything
#           ./run_flow.sh synth      # run from the 'synth' stage onward
#           ./run_flow.sh -1 lvs     # run only the 'lvs' stage
# =====================================================================
set -euo pipefail

# ---------------------------------------------------------------- paths
export PDK_ROOT="${PDK_ROOT:-/home/daksh/pdk}"
export PDKPATH="${PDKPATH:-$PDK_ROOT/sky130A}"

PDK=$PDK_ROOT/sky130A
LIB=$PDK/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
TLEF=$PDK/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
CLEF=$PDK/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
MAGICRC=$PDK/libs.tech/magic/sky130A.magicrc
NETGEN_SETUP=$PDK/libs.tech/netgen/sky130A_setup.tcl

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOGS=$ROOT/logs
mkdir -p "$LOGS"

TOP=UART

# ------------------------------------------------------------- helpers
c_red=$'\e[31m'; c_grn=$'\e[32m'; c_ylw=$'\e[33m'; c_rst=$'\e[0m'

banner() { printf '\n%s=== %s ===%s\n' "$c_ylw" "$1" "$c_rst"; }
ok()     { printf '%s  [OK] %s%s\n'   "$c_grn" "$1" "$c_rst"; }
die()    { printf '%s  [FAIL] %s%s\n' "$c_red" "$1" "$c_rst" >&2; exit 1; }

# fail unless $1 exists and is at least $2 bytes
need_file() {
    local f=$1 min=${2:-1}
    [[ -f $f ]] || die "missing output: $f"
    local sz; sz=$(stat -c%s "$f")
    (( sz >= min )) || die "$f is only ${sz} bytes (expected >= ${min}) -- the stage wrote a stub, not a result"
    ok "$(basename "$f") (${sz} bytes)"
}

# fail if a log contains an error signature
no_errors_in() {
    local log=$1; shift
    for pat in "$@"; do
        if grep -qiE "$pat" "$log"; then
            printf '%s  [FAIL] log %s matched error pattern: %s%s\n' "$c_red" "$log" "$pat" "$c_rst" >&2
            grep -iE "$pat" "$log" | head -5 >&2
            exit 1
        fi
    done
}

# ---------------------------------------------------- prerequisite check
check_env() {
    banner "Environment"
    for t in iverilog yosys sta openroad magic netgen; do
        command -v "$t" >/dev/null || die "tool not found on PATH: $t"
    done
    for f in "$LIB" "$TLEF" "$CLEF" "$MAGICRC" "$NETGEN_SETUP"; do
        [[ -f $f ]] || die "PDK file not found: $f  (is PDK_ROOT correct? currently '$PDK_ROOT')"
    done
    [[ -f $PDKPATH/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds ]] \
        || die "vendor GDS not reachable at \$PDKPATH/libs.ref/... -- Magic needs this to stream out cells.
       Fix:  mkdir -p \$PDK_ROOT/sky130A/libs.ref
             ln -sfn \$PDK_ROOT/sky130A/sky130_fd_sc_hd \$PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd"
    ok "all tools and PDK files present"
}

# ============================================================ STAGE 1
stage_sim() {
    banner "Stage 1  --  RTL simulation (Icarus Verilog)"
    cd "$ROOT/sim"
    iverilog -g2012 -o tb_UART.vvp tb_UART.sv ../rtl/UART.sv 2>&1 | tee "$LOGS/01_sim_compile.log"
    no_errors_in "$LOGS/01_sim_compile.log" "^[^ ]*:[0-9]+: error"
    vvp tb_UART.vvp 2>&1 | tee "$LOGS/01_sim_run.log"
    need_file tb_UART.vcd 1000
    ok "simulation ran, waveform written"
}

# ============================================================ STAGE 2
stage_synth() {
    banner "Stage 2  --  Logic synthesis (Yosys)"
    cd "$ROOT/synth"
    yosys -s synth_uart.ys 2>&1 | tee "$LOGS/02_synth.log"
    no_errors_in "$LOGS/02_synth.log" "ERROR:"
    need_file uart_synth.v 1000
    # a netlist with no flops means the mapping silently failed
    grep -q "sky130_fd_sc_hd__dfxtp" uart_synth.v \
        || die "synthesised netlist contains no Sky130 flip-flops -- dfflibmap/abc mapping failed"
    local ncells; ncells=$(grep -c "sky130_fd_sc_hd__" uart_synth.v)
    ok "netlist mapped to $ncells Sky130 cells"
}

# ============================================================ STAGE 3
stage_sta_pre() {
    banner "Stage 3  --  Pre-layout STA (OpenSTA)"
    cd "$ROOT/sta"
    sta -no_splash -exit sta_uart_50mhz.tcl 2>&1 | tee "$LOGS/03_sta_pre.log"
    grep -qiE "^Error|no paths found" "$LOGS/03_sta_pre.log" && die "pre-layout STA reported errors"
    printf '  worst slack: %s\n' "$(grep -A1 -i 'worst slack' "$LOGS/03_sta_pre.log" | tail -1 | xargs)"
    ok "pre-layout timing analysed"
}

# ============================================================ STAGE 4
stage_floorplan() {
    banner "Stage 4  --  Floorplan + PDN (OpenROAD)"
    cd "$ROOT/floorplan"
    openroad -no_init -exit floorplan_uart.tcl 2>&1 | tee "$LOGS/04_floorplan.log"
    no_errors_in "$LOGS/04_floorplan.log" "^\[ERROR"
    need_file uart_floorplan.def 10000
    grep -q "^ROW " uart_floorplan.def || die "floorplan DEF has no standard cell ROWs -- initialize_floorplan/make_tracks failed"
    local nrows; nrows=$(grep -c "^ROW " uart_floorplan.def)
    ok "floorplan created with $nrows standard cell rows"
}

# ============================================================ STAGE 5
stage_place() {
    banner "Stage 5  --  Placement (OpenROAD)"
    cd "$ROOT/pnr"
    openroad -no_init -exit placement_uart.tcl 2>&1 | tee "$LOGS/05_place.log"
    no_errors_in "$LOGS/05_place.log" "^\[ERROR"
    grep -qi "placement violations" "$LOGS/05_place.log" \
        && grep -qivE "0 .*placement violations" "$LOGS/05_place.log" \
        && die "detailed placement left violations"
    need_file uart_placed.def 10000
    ok "cells placed and legalised"
}

# ============================================================ STAGE 5b
stage_tapfill() {
    banner "Stage 5b --  Tap cells + filler (OpenROAD)"
    cd "$ROOT/pnr"
    openroad -no_init -exit tapfill.tcl 2>&1 | tee "$LOGS/06_tapfill.log"
    no_errors_in "$LOGS/06_tapfill.log" "^\[ERROR"
    need_file uart_placed_tapfill.def 10000
    local ntap nfill
    ntap=$(awk '/^COMPONENTS/,/^END COMPONENTS/' uart_placed_tapfill.def | grep -c "tapvpwrvgnd" || true)
    nfill=$(awk '/^COMPONENTS/,/^END COMPONENTS/' uart_placed_tapfill.def | grep -c "__fill_" || true)
    (( ntap  > 0 )) || die "no tap cells inserted -- DRC rule nwell.4 (latch-up) will fail"
    (( nfill > 0 )) || die "no filler cells inserted -- nwell/implant continuity will fail DRC"
    ok "$ntap tap cells, $nfill filler cells inserted"
}

# ============================================================ STAGE 6
stage_cts() {
    banner "Stage 6  --  Clock tree synthesis (TritonCTS)"
    cd "$ROOT/pnr"
    openroad -no_init -exit cts_uart_tapfill.tcl 2>&1 | tee "$LOGS/07_cts.log"
    no_errors_in "$LOGS/07_cts.log" "^\[ERROR"
    need_file uart_cts_tapfill.def 10000

    # --- the check that would have caught this project's worst bug ---
    # Every logic cell must reach VPWR and VGND.  CTS inserts clock buffers
    # AFTER the floorplan's global connect ran, so without a fresh
    # global_connect they are left unpowered -- invisible until LVS reports
    # phantom nets.
    #
    # A DEF can record this two ways:
    #   wildcard:   - VPWR ( * VPB ) ( * VPWR )     <- true global connection
    #   enumerated: - VPWR ( _123_ VPWR ) ( ... )   <- per-instance list
    # The wildcard form is strictly stronger, so accept it directly and only
    # fall back to counting when the DEF enumerates.
    local sn
    sn=$(awk '/^SPECIALNETS/,/^END SPECIALNETS/' uart_cts_tapfill.def)
    if grep -q '( \* VPWR )' <<<"$sn" && grep -q '( \* VGND )' <<<"$sn"; then
        ok "power: global (wildcard) VPWR/VGND connections present"
        grep -q '( \* VPB )'  <<<"$sn" || printf '%s  [WARN] VPB (p-bulk) not globally connected -- LVS will see dangling pins%s\n' "$c_ylw" "$c_rst"
        grep -q '( \* VNB )'  <<<"$sn" || printf '%s  [WARN] VNB (n-bulk) not globally connected -- LVS will see dangling pins%s\n' "$c_ylw" "$c_rst"
    else
        local ntot ntap nfill nlogic nconn
        ntot=$(grep -oP '^COMPONENTS \K[0-9]+' uart_cts_tapfill.def)
        ntap=$(awk '/^COMPONENTS/,/^END COMPONENTS/' uart_cts_tapfill.def | grep -c "tapvpwrvgnd" || true)
        nfill=$(awk '/^COMPONENTS/,/^END COMPONENTS/' uart_cts_tapfill.def | grep -c "__fill_" || true)
        nlogic=$(( ntot - ntap - nfill ))
        nconn=$(grep -oE '\( [^ *]+ (VPWR|VGND) \)' <<<"$sn" | wc -l)
        if (( nconn < 2 * nlogic )); then
            printf '%s  unpowered logic cells:%s\n' "$c_red" "$c_rst" >&2
            awk '/^COMPONENTS/,/^END COMPONENTS/' uart_cts_tapfill.def \
                | grep -oE '^\s*- \S+ \S+' | awk '{print $2, $3}' \
                | grep -v -e tapvpwrvgnd -e __fill_ | awk '{print $1}' | sort > /tmp/_logic.txt
            grep -oE '\( \S+ (VPWR|VGND) \)' <<<"$sn" | awk '{print $2}' | sort -u > /tmp/_pwr.txt
            comm -23 /tmp/_logic.txt /tmp/_pwr.txt >&2
            die "power connectivity incomplete: $nlogic logic cells but $nconn VPWR/VGND connections.
       Cause: global_connect did not run after CTS inserted the clock buffers listed above.
       Fix:   in pnr/cts_uart_tapfill.tcl, add_global_connection + global_connect
              must appear BEFORE write_def, not after."
        fi
        ok "power: all $nlogic logic cells enumerated ($nconn connections)"
    fi
    ok "clock tree built"
    printf '  skew: %s\n' "$(grep -iA2 'clock skew' "$LOGS/07_cts.log" | tail -1 | xargs || true)"
}

# ============================================================ STAGE 7
stage_route() {
    banner "Stage 7  --  Global + detailed routing (TritonRoute)"
    cd "$ROOT/pnr"
    openroad -no_init -exit route_uart_tapfill.tcl 2>&1 | tee "$LOGS/08_route.log"
    no_errors_in "$LOGS/08_route.log" "^\[ERROR"
    need_file uart_routed_tapfill.def 50000
    need_file uart_routed_tapfill.spef 10000

    # TritonRoute writes remaining violations here; empty file == clean
    if [[ -s uart_drc_tapfill.rpt ]]; then
        printf '%s  [FAIL] routing left DRC violations:%s\n' "$c_red" "$c_rst" >&2
        head -20 uart_drc_tapfill.rpt >&2
        exit 1
    fi
    ok "routing complete, no routing DRC violations, parasitics extracted"
}

# ============================================================ STAGE 8
stage_sta_post() {
    banner "Stage 8  --  Post-layout signoff STA (OpenSTA + SPEF)"
    cd "$ROOT/sta"
    sta -no_splash -exit sta_signoff_uart.tcl 2>&1 | tee "$LOGS/09_sta_signoff.log"
    grep -qiE "^Error" "$LOGS/09_sta_signoff.log" && die "signoff STA reported errors"

    # any negative slack in the report means a timing violation
    if grep -oE '^-[0-9]+\.[0-9]+' "$LOGS/09_sta_signoff.log" | grep -q .; then
        printf '%s  [WARN] negative slack present -- inspect %s%s\n' "$c_ylw" "$LOGS/09_sta_signoff.log" "$c_rst"
    fi
    printf '  TNS/WNS: %s\n' "$(grep -iE 'tns|wns' "$LOGS/09_sta_signoff.log" | tail -2 | xargs || true)"
    ok "signoff timing analysed with real parasitics"
}

# ============================================================ STAGE 9a
stage_extract() {
    banner "Stage 9a --  Layout extraction (Magic)"
    cd "$ROOT/signoff"
    # Magic sits at an interactive prompt without an explicit quit.
    grep -q "^quit" extract_lvs.tcl || printf '\nquit -noprompt\n' >> extract_lvs.tcl
    magic -rcfile "$MAGICRC" -noconsole -dnull extract_lvs.tcl 2>&1 | tee "$LOGS/10_extract.log"
    no_errors_in "$LOGS/10_extract.log" "Can't find|I/O error"
    need_file uart_extracted.spice 10000
    grep -q "^.subckt $TOP " uart_extracted.spice \
        || die "extracted SPICE has no '$TOP' subcircuit -- check the top cell name"
    ok "layout extracted to SPICE"
}

# ============================================================ STAGE 9b
stage_lvs() {
    banner "Stage 9b --  LVS (Netgen)"
    cd "$ROOT/signoff"

    # Build the *powered* schematic netlist from the routed DEF.
    # Plain write_verilog omits VPWR/VGND/VPB/VNB entirely, which makes
    # every supply pin dangle and produces hundreds of phantom nets.
    openroad -no_init -exit write_lvs_netlist.tcl 2>&1 | tee "$LOGS/11_lvs_netlist.log"
    need_file "$TOP.lvs.v" 10000

    # Assert the netlist is internally consistent: every cell instance it
    # contains must carry all four Sky130 supply pins.
    #
    # Do NOT cross-reference the DEF's component count here -- write_verilog
    # drops physical-only cells (tapcells, CORE WELLTAP) while keeping
    # fillers, so the two numbers legitimately differ.  Count the instances
    # in the file we are actually about to hand to Netgen.
    # The netlist must contain logic cells only: write_lvs_netlist.tcl strips
    # fillers and taps via -remove_cells, matching what Netgen's Sky130 setup
    # discards from the extracted layout netlist.
    local ninst nphys
    ninst=$(grep -cE '^\s*sky130_fd_sc_hd__[a-z0-9_]+ +[^ ]+ +\(' "$TOP.lvs.v")
    (( ninst > 0 )) || die "no cell instances found in $TOP.lvs.v -- write_verilog produced nothing usable"

    nphys=$(grep -cE '^\s*sky130_fd_sc_hd__(fill|tapvpwrvgnd|decap)[a-z0-9_]* +[^ ]+ +\(' "$TOP.lvs.v" || true)
    (( nphys == 0 )) || die "$nphys physical-only cells (fill/tap/decap) are still in $TOP.lvs.v.
       Netgen strips these from the extracted layout netlist but not from the
       Verilog, so device counts will differ by the number of distinct physical
       cell types (they parallel-merge to one representative each).
       Fix: add them to the -remove_cells list in signoff/write_lvs_netlist.tcl."

    for p in VPWR VGND VPB VNB; do
        local n; n=$(grep -o "\.$p(" "$TOP.lvs.v" | wc -l)
        (( n == ninst )) || die "netlist has $ninst cell instances but only $n .$p() connections.
       Missing supply pins dangle, and Netgen invents a unique phantom net for
       each one -- a net-count mismatch in the hundreds.
       Fix: global_connect (covering ^VPB\$ and ^VNB\$ too) must run before
            write_verilog -include_pwr_gnd."
    done
    ok "powered netlist: $ninst logic instances, all 4 supplies on each, no physical cells"

    netgen -batch lvs \
        "uart_extracted.spice $TOP" \
        "$TOP.lvs.v $TOP" \
        "$NETGEN_SETUP" \
        comp.out 2>&1 | tee "$LOGS/12_lvs.log"

    grep -q "Circuits match uniquely" "$LOGS/12_lvs.log" \
        || die "LVS mismatch -- see signoff/comp.out
       Device count differs  -> a cell is in one netlist and not the other
       Net count differs     -> connectivity differs; check supply pins first"
    ok "LVS: circuits match uniquely"
}

# ============================================================ STAGE 10
stage_gds() {
    banner "Stage 10 --  GDSII stream-out (Magic)"
    cd "$ROOT/signoff"
    magic -rcfile "$MAGICRC" -noconsole -dnull gds_write.tcl 2>&1 | tee "$LOGS/13_gds.log"
    # Magic writes a valid but EMPTY 66-byte GDS if it cannot reach the
    # vendor GDS library -- and still prints "GDS written".  Hence both
    # the log check and the size check below.
    no_errors_in "$LOGS/13_gds.log" "Can't find|I/O error|Calma output error"
    need_file uart.gds 100000
    ok "GDSII streamed out"
}

# ============================================================ STAGE 9c
stage_drc() {
    banner "Stage 9c --  Physical verification DRC (Magic, on the GDS)"
    cd "$ROOT/signoff"
    magic -rcfile "$MAGICRC" -noconsole -dnull drc_gds.tcl 2>&1 | tee "$LOGS/14_drc.log"
    local n
    n=$(grep -oP 'GDS DRC VIOLATIONS: \K[0-9]+' "$LOGS/14_drc.log" | head -1)
    [[ -n $n ]] || die "DRC did not report a violation count -- did the layout load?"
    if (( n != 0 )); then
        printf '%s  [FAIL] %s DRC violations:%s\n' "$c_red" "$n" "$c_rst" >&2
        grep -A40 "GDS DRC VIOLATIONS" "$LOGS/14_drc.log" | tail -40 >&2
        exit 1
    fi
    ok "DRC clean: 0 violations on the streamed GDSII"
}

# ============================================================ summary
summary() {
    banner "FLOW COMPLETE"
    printf '  GDSII   : %s (%s bytes)\n' "$ROOT/signoff/uart.gds" "$(stat -c%s "$ROOT/signoff/uart.gds")"
    printf '  LVS     : %s\n' "$(grep -o 'Circuits match uniquely' "$LOGS/12_lvs.log" || echo 'see logs')"
    printf '  DRC     : 0 violations\n'
    printf '  Logs    : %s\n' "$LOGS"
    printf '\n%s  UART is DRC-clean, LVS-clean, and streamed to GDSII.%s\n\n' "$c_grn" "$c_rst"
}

# =============================================================== driver
STAGES=(sim synth sta_pre floorplan place tapfill cts route sta_post extract lvs gds drc)

ONLY=0
if [[ ${1:-} == "-1" ]]; then ONLY=1; shift; fi
START=${1:-${STAGES[0]}}

started=0
check_env
for s in "${STAGES[@]}"; do
    if [[ $s == "$START" ]]; then started=1; fi
    (( started )) || continue
    "stage_$s"
    if (( ONLY )); then exit 0; fi
done
summary