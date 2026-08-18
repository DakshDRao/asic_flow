tech load /home/daksh/pdk/sky130A/libs.tech/magic/sky130A.tech
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/mag
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
def read ../pnr/uart_routed.def

# Pull in the real .mag geometry for every standard cell instance,
# so the layout is complete (not LEF abstracts) before we stream out.
load UART
cellname list allcells

# Stream to GDS -- this is your Stage 10 deliverable AND the clean DRC input
gds write uart.gds
puts "GDS written."

# Now re-read the GDS fresh and DRC *that*
gds read uart.gds
load UART
select top cell
expand
drc check
drc catchup
puts "GDS-based DRC total: [drc list count total]"
drc why