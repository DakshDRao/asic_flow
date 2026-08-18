gds read uart.gds
load UART
select top cell
expand
drc euclidean on
drc style drc(full)
drc check
drc catchup
set n [drc list count total]
puts "=== GDS DRC VIOLATIONS: $n ==="
if {$n > 0} { drc why }
quit -noprompt
