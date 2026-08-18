# OpenROAD clock tree synthesis for UART
# Stage 6: build a balanced clock distribution network with TritonCTS

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

read_def ../pnr/uart_placed_tapfill.def
read_sdc ../constraints/uart_50mhz.sdc

set_wire_rc -clock -layer met3

clock_tree_synthesis -root_buf sky130_fd_sc_hd__clkbuf_4 \
    -buf_list {sky130_fd_sc_hd__clkbuf_1 sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8} \
    -sink_clustering_enable

# Strip fillers BEFORE legalizing -- otherwise they count as movable area
# and push utilization over 100%, making legalization impossible (DPL-0038).
remove_fillers

# Now legalize the real logic + tap cells + new CTS clock buffers
detailed_placement

# Re-insert fillers into the remaining gaps for nwell continuity
filler_placement "sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8"
check_placement

# --- Re-establish power/ground connectivity -------------------------------
# CRITICAL, AND CRITICAL THAT IT HAPPENS *BEFORE* write_def.
#
# The floorplan stage ran add_global_connection/pdngen before any of these
# cells existed.  CTS has since inserted clock buffers, and filler_placement
# has inserted fill cells; none of them are connected to VPWR/VGND in the
# database.  Physically they sit on the met1 power rails and are fine -- but
# the DEF's record of the connection is missing, which shows up much later
# as an LVS net-count mismatch that looks like a design bug and is not.
#
# VPB/VNB are the p-well and n-well bulk taps.  They must be tied to VPWR
# and VGND respectively, or every cell has two dangling pins and Netgen
# invents a unique phantom net for each one.
add_global_connection -net VPWR -pin_pattern {^VPWR$} -power
add_global_connection -net VGND -pin_pattern {^VGND$} -ground
add_global_connection -net VPWR -pin_pattern {^VPB$}  -power
add_global_connection -net VGND -pin_pattern {^VNB$}  -ground
global_connect

# --- Reports --------------------------------------------------------------
report_clock_skew
report_worst_slack -max
report_worst_slack -min
report_design_area

# --- Write outputs (AFTER global_connect, so the DEF records the supplies) -
write_def uart_cts_tapfill.def
write_verilog uart_cts_tapfill.v
puts "=== CTS (tapfill) done ==="