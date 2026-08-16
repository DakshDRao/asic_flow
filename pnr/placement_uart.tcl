# OpenROAD placement script for UART
# Stage 5: global placement (wirelength-driven optimization) then
# detailed placement (legalization onto the standard cell row grid)

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# Read in the floorplanned design from Stage 4 (die/core area, I/O pins,
# and power grid are already defined in this DEF file)
read_def ../floorplan/uart_floorplan.def

read_sdc ../constraints/uart_50mhz.sdc

# --- Global placement ---
# -density: target placement density (should roughly match/slightly exceed
#           our floorplan utilization -- 0.55 gives a little headroom above
#           our 0.538 effective utilization from Stage 4)
# -init_density_penalty: how strongly the optimizer is penalized for
#           exceeding local density limits during early iterations
global_placement -density 0.55

# --- Report placement-based (still pre-CTS, using ideal clocks) timing ---
# This is a checkpoint: are we still meeting timing after real cell
# positions (and therefore more realistic-ish wire load estimates) are
# assigned, even though clock tree and real routing haven't happened yet?
report_worst_slack -max
report_worst_slack -min

# --- Detailed placement ---
# Legalizes global placement's result onto the standard cell row/site grid:
# no overlaps, everything row-aligned.
detailed_placement

# --- Verify legality ---
# check_placement reports any remaining illegal placements (overlaps,
# off-grid cells, row violations) -- should report clean if detailed
# placement succeeded.
check_placement -verbose

# --- Reports ---
report_design_area

# --- Write outputs ---
write_def uart_placed.def
write_verilog uart_placed.v