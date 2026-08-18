read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

read_def ../pnr/uart_cts_tapfill.def
read_sdc ../constraints/uart_50mhz.sdc

set_global_routing_layer_adjustment met1-met5 0.5
global_route -guide_file uart_route_tapfill.guide
report_design_area

set_routing_layers -signal met1-met5
detailed_route -output_drc uart_drc_tapfill.rpt -output_maze uart_maze_tapfill.log

write_def uart_routed_tapfill.def
write_verilog uart_routed_tapfill.v

set_extraction_rules_file /home/daksh/pdk/sky130A/extraction_rules/rcx_patterns.rules
extract_parasitics
write_spef uart_routed_tapfill.spef
report_design_area
puts "=== ROUTE (tapfill) done ==="
