# Load the routed design with correct scale (PDK rcfile) + real cell views
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/maglef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
def read ../pnr/uart_routed_tapfill.def
load UART

# --- Extraction ---
# Because we loaded standard cells as maglef ABSTRACTS, each cell is a
# black box with pins -- extraction captures the top-level routing
# connectivity between cell pins, and treats each standard cell as a
# subcircuit instance (matched by name against the Verilog). This is
# exactly what we want for a hierarchical LVS against a gate netlist.
extract do local
extract all

# --- Convert the extracted database to a SPICE netlist ---
# ext2spice lvs sets LVS-friendly options (subcircuit ports, no parasitic
# R/C junk, hierarchical). Then write the .spice file.
ext2spice lvs
ext2spice -o uart_extracted.spice
puts "=== extraction done ==="
