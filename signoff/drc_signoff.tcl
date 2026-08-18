addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/maglef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
def read ../pnr/uart_routed_tapfill.def
load UART -dereference
select top cell
expand
drc euclidean on
drc style drc(full)
drc check
drc catchup
set n [drc list count total]
puts "=== DRC VIOLATIONS: $n ==="
if {$n > 0} { drc why }
quit -noprompt
