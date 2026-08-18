read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
read_def ../pnr/uart_routed_tapfill.def
write_verilog -include_pwr_gnd uart_routed_tapfill_pwr.v
puts "=== power-aware verilog written ==="
