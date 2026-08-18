tech load /home/daksh/pdk/sky130A/libs.tech/magic/sky130A.tech

# Only the TECH LEF (layer + via definitions). Do NOT read the cell LEF --
# that is what created hollow abstract views and caused every nwell/li
# violation. We want real geometry instead.
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef

# Point Magic at the real cell layouts BEFORE reading the DEF, so each
# instance resolves to true drawn geometry (.mag), not an abstract.
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/mag

def read ../pnr/uart_routed.def

load UART
select top cell
expand

# Confirm cells are no longer abstract: this should list real cells
puts "=== instance check ==="
drc check
drc catchup
puts "DRC total after real-geometry load: [drc list count total]"
drc why