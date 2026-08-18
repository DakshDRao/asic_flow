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

report_clock_skew
report_worst_slack -max
report_worst_slack -min
report_design_area

write_def uart_cts_tapfill.def
write_verilog uart_cts_tapfill.v
add_global_connection -net VPWR -pin_pattern {^VPWR$} -power
add_global_connection -net VGND -pin_pattern {^VGND$} -ground
add_global_connection -net VPWR -pin_pattern {^VPB$}  -power
add_global_connection -net VGND -pin_pattern {^VNB$}  -ground
global_connect
puts "=== CTS (tapfill) done ==="
