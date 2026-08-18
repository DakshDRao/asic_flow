# Point at the maglef abstract views (DEF-scale-aligned, correct grid).
# These resolve cell instances without the mag/ scale-desync that produced
# 21058 phantom transistor-level violations.
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/maglef

# Read only the tech LEF for layer/via rules.
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef

def read ../pnr/uart_routed_tapfill.def
load UART
select top cell
expand

drc euclidean on
drc check
drc catchup
puts "=== FINAL DRC COUNT: [drc list count total] ==="
drc why