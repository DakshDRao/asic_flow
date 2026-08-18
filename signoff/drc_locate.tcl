addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/maglef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
def read ../pnr/uart_routed.def
load UART
select top cell
expand
drc euclidean on
drc check
drc catchup
puts "=== COUNT: [drc list count total] ==="
set n [drc list count total]
for {set i 0} {$i < $n} {incr i} {
    set r [drc find]
    if {$r == ""} break
    puts "VIOL [expr {$i+1}]: [box values]"
}
