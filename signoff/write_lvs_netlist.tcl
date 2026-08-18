# Generate the *powered* gate-level netlist for LVS.
#
# Two things this script must get right, both of which produce confusing
# LVS failures if missed:
#
# 1. -include_pwr_gnd
#    Plain write_verilog emits signal pins only.  Sky130 cells have four
#    supply pins -- VPWR, VGND, VPB (p-bulk), VNB (n-bulk) -- and the
#    extracted layout netlist contains all of them.  Omit them and every
#    supply pin dangles; Netgen invents a unique net per dangling pin and
#    reports a net-count mismatch in the hundreds.
#
# 2. -remove_cells
#    Fillers and tap cells are physical-only: they implement no logic and
#    exist for nwell/implant continuity and latch-up prevention.  Netgen's
#    Sky130 setup file discards them from the *layout* netlist, so leaving
#    them in the *schematic* netlist makes the device counts disagree by
#    exactly the number of distinct physical cell types (they merge to one
#    representative each under parallel-device merging).

read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
read_def ../pnr/uart_routed_tapfill.def

# Belt and braces: the routed DEF should already carry these connections
# (cts_uart_tapfill.tcl runs global_connect before writing), but re-running
# here is harmless and makes this script independently correct.
add_global_connection -net VPWR -pin_pattern {^VPWR$} -power
add_global_connection -net VGND -pin_pattern {^VGND$} -ground
add_global_connection -net VPWR -pin_pattern {^VPB$}  -power
add_global_connection -net VGND -pin_pattern {^VNB$}  -ground
global_connect

set physical_cells [list \
    sky130_fd_sc_hd__fill_1 \
    sky130_fd_sc_hd__fill_2 \
    sky130_fd_sc_hd__fill_4 \
    sky130_fd_sc_hd__fill_8 \
    sky130_fd_sc_hd__tapvpwrvgnd_1 \
    sky130_fd_sc_hd__decap_3 \
    sky130_fd_sc_hd__decap_4 \
    sky130_fd_sc_hd__decap_6 \
    sky130_fd_sc_hd__decap_8 \
    sky130_fd_sc_hd__decap_12 ]

write_verilog -include_pwr_gnd -remove_cells $physical_cells UART.lvs.v
puts "=== LVS netlist written (physical-only cells removed) ==="