#!/usr/bin/env bash
# =====================================================================
#  asic_flow  --  working-directory cleanup
#
#  Whitelist-based: every file that is NOT part of the canonical flow is
#  moved into _trash/ (preserving its path) so you can review before
#  deleting.  Nothing is removed permanently by this script.
#
#      ./cleanup.sh            # dry run -- list what would move
#      ./cleanup.sh --apply    # actually move files into _trash/
#      rm -rf _trash           # once you've checked, delete for real
# =====================================================================
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$ROOT"
APPLY=0
[[ ${1:-} == "--apply" ]] && APPLY=1

# --------------------------------------------------- canonical file set
KEEP=(
  .gitignore
  README.md
  run_flow.sh
  cleanup.sh

  rtl/UART.sv
  sim/tb_UART.sv

  constraints/uart_50mhz.sdc
  constraints/uart_500mhz.sdc

  synth/synth_uart.ys
  synth/uart_synth.v
  synth/uart_synth.json

  sta/sta_uart_50mhz.tcl
  sta/sta_uart_500mhz.tcl
  sta/sta_signoff_uart.tcl

  floorplan/floorplan_uart.tcl
  floorplan/uart_floorplan.def
  floorplan/uart_floorplan.v

  pnr/placement_uart.tcl
  pnr/tapfill.tcl
  pnr/cts_uart_tapfill.tcl
  pnr/route_uart_tapfill.tcl
  pnr/uart_placed.def
  pnr/uart_placed.v
  pnr/uart_placed_tapfill.def
  pnr/uart_cts_tapfill.def
  pnr/uart_cts_tapfill.v
  pnr/uart_routed_tapfill.def
  pnr/uart_routed_tapfill.v
  pnr/uart_routed_tapfill.spef
  pnr/uart_route_tapfill.guide
  pnr/uart_drc_tapfill.rpt          # empty == routing was DRC-clean; that IS the evidence

  signoff/extract_lvs.tcl
  signoff/write_lvs_netlist.tcl
  signoff/gds_write.tcl
  signoff/drc_gds.tcl
  signoff/uart_extracted.spice
  signoff/UART.lvs.v
  signoff/comp.out
  signoff/uart.gds
)

is_kept() {
  local f=${1#./}
  for k in "${KEEP[@]}"; do [[ $f == "$k" ]] && return 0; done
  # keep everything the flow writes under logs/
  [[ $f == logs/* ]] && return 0
  [[ $f == _trash/* ]] && return 0
  [[ $f == .git/* ]] && return 0
  return 1
}

moved=0; kept=0
while IFS= read -r -d '' f; do
  if is_kept "$f"; then
    kept=$((kept+1)); continue
  fi
  rel=${f#./}
  sz=$(stat -c%s "$f")
  printf '  %-55s %9s bytes\n' "$rel" "$sz"
  moved=$((moved+1))
  if (( APPLY )); then
    mkdir -p "_trash/$(dirname "$rel")"
    mv "$f" "_trash/$rel"
  fi
done < <(find . -path ./.git -prune -o -path ./_trash -prune -o -type f -print0)

echo
if (( APPLY )); then
  echo "moved $moved file(s) to _trash/  ($kept kept)"
  echo "review with:  find _trash -type f | sort"
  echo "then:         rm -rf _trash"
else
  echo "$moved file(s) would be moved, $kept kept.  Re-run with --apply to do it."
fi

# --------------------------------------------------- empty directories
if (( APPLY )); then
  find . -path ./.git -prune -o -type d -empty -print -delete 2>/dev/null || true
fi