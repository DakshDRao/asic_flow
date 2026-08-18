gds readonly true
gds rescale false
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/mag
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
def read ../pnr/uart_routed_tapfill.def
load UART -dereference
select top cell
gds write uart.gds
puts "=== GDS written ==="
quit -noprompt
