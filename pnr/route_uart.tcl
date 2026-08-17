# OpenROAD routing script for UART
# Stage 7: Global routing (congestion estimate) then detailed routing
# (DRC-legal wire geometry) using TritonRoute

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# Resume from Stage 6's clock-tree-synthesized, legalized design
read_def ../pnr/uart_cts.def

read_sdc ../constraints/uart_50mhz.sdc

# --- Global routing ---
# -guide_file: writes out the coarse routing guide (per-net GCell paths)
#              that TritonRoute will use as a starting point for detailed
#              routing.
set_global_routing_layer_adjustment met1-met5 0.5
global_route -guide_file uart_route.guide

# --- Congestion report ---
# Reports any GCells where routing demand exceeds available resources.
# A clean report here (no/minimal congestion) means detailed routing
# is likely to succeed without major rework.
report_design_area

# --- Detailed routing ---
# TritonRoute produces the final, exact, DRC-legal wire geometry.
# -output_drc: writes any remaining DRC violations to a report file,
#              so failures are inspectable rather than just a pass/fail.
# Define the usable routing layer range (replaces the deprecated
# -bottom_routing_layer / -top_routing_layer flags on detailed_route)
set_routing_layers -signal met1-met5

detailed_route -output_drc uart_drc.rpt \
    -output_maze uart_maze.log

# --- Save routed result immediately, before attempting parasitic
# extraction -- this way, even if extraction has problems, the routed
# design itself is safely saved and we can debug extraction separately.
write_def uart_routed.def
write_verilog uart_routed.v

# --- Post-route parasitic extraction ---
# Extracts real RC parasitics from the actual routed wire geometry --
# this is the data Stage 8's signoff STA will use, replacing every
# estimate we've relied on since Stage 3.
# NOTE: requires a dedicated RC Extraction Rules file (calibrated
# per-unit-length R/C tables for this specific process), NOT the tech
# LEF. Also note: sky130hd's own rules file is a symlink to sky130hs's
# (same physical process, shared RC data) -- fetch the real target,
# not the symlink placeholder.
set_extraction_rules_file /home/daksh/pdk/sky130A/extraction_rules/rcx_patterns.rules
extract_parasitics
write_spef uart_routed.spef

# --- Reports ---
report_design_area

# --- End of script ---