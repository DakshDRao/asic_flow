set circuit1 [readnet spice uart_extracted.spice]
set circuit2 [readnet verilog ../pnr/uart_routed_tapfill_lvs.v]
readnet spice /home/daksh/pdk/sky130A/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $circuit2
lvs [list $circuit1 UART] [list $circuit2 UART] \
    /home/daksh/pdk/sky130A/libs.tech/netgen/setup.tcl \
    uart_lvs.report
