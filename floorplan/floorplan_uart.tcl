# OpenROAD floorplanning script for UART
# Stage 4: define core/die area, place I/O pins, generate power distribution network

# --- Read Liberty timing library (same file used in Stage 2/3) ---
read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# --- Read technology LEF (defines metal layers, routing rules, site geometry) ---
# and cell LEF (defines each standard cell's physical footprint/pin locations)
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# --- Read the gate-level netlist from Stage 2 ---
read_verilog ../synth/uart_synth.v
link_design UART

# --- Apply timing constraints (same SDC used in Stage 3, 50MHz baseline) ---
read_sdc ../constraints/uart_50mhz.sdc

# --- Initialize the floorplan ---
# -utilization 50: standard cells occupy ~50% of the core area
# -aspect_ratio 1.0: square core
# -core_space: margin (in microns) between core area and die boundary,
#              reserved for the power ring
initialize_floorplan -utilization 50 -aspect_ratio 1.0 -core_space 2.0 \
    -site unithd

# --- Generate the routing track grid ---
# Explicitly builds the legal on-grid routing positions for every metal
# layer defined in the tech LEF. place_pins (and later, global/detailed
# routing) needs this track grid to exist -- without it, tools have no
# concept of which X/Y positions are legal for wires on a given layer.
make_tracks

# --- Place I/O pins automatically around the core boundary ---
place_pins -hor_layers met3 -ver_layers met2

# --- Power distribution network ---
# Sky130 standard cells use VPWR (power) and VGND (ground) pin names --
# NOT the generic VDD/VSS seen in many non-Sky130 example scripts.

# Step 1: tell OpenROAD which named net each cell's power/ground pins
# should be logically connected to.
add_global_connection -net VPWR -pin_pattern "^VPWR$" -power
add_global_connection -net VGND -pin_pattern "^VGND$" -ground

# Step 2: declare the voltage domain using those nets
set_voltage_domain -power VPWR -ground VGND

# Step 3: define a PDN grid over the standard cell area
define_pdn_grid -name "core_grid" -voltage_domain "CORE"

# Step 4: followpins stripe on met1 -- this literally follows the
# built-in horizontal power rails that run through every standard
# cell row (every cell already has VPWR/VGND rails on met1 as part
# of its own physical layout -- "followpins" just connects them all
# together into one continuous rail per row).
add_pdn_stripe -grid "core_grid" -layer met1 -followpins -width 0.48

# Step 5: a small number of vertical met4 straps to carry power
# down into the met1 rails from a higher, lower-resistance layer.
# For a design this tiny, a sparse strap pattern is plenty --
# we don't need met5 or a full ring given the small die size.
add_pdn_stripe -grid "core_grid" -layer met4 -width 0.48 -pitch 20.0 -offset 2.0

# Step 6: vias connecting met1 (cell rails) to met4 (straps)
add_pdn_connect -grid "core_grid" -layers {met1 met4}

# Step 7: actually build the grid from the policy defined above
pdngen

# --- Reports / checkpoint ---
report_design_area

# --- Write outputs ---
write_def uart_floorplan.def
write_verilog uart_floorplan.v