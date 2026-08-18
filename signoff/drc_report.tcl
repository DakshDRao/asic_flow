tech load /home/daksh/pdk/sky130A/libs.tech/magic/sky130A.tech
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/mag
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
def read ../pnr/uart_routed.def
select top cell
expand
drc check
drc catchup

# Total count
puts "TOTAL: [drc list count total]"

# Per-rule breakdown -- this is the command that actually enumerates
# violation types with their coordinates
puts "=== BREAKDOWN BY RULE ==="
drc listall why