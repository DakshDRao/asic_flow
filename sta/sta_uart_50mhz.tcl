# OpenSTA script: UART pre-layout STA, baseline 50MHz (20ns period)

# --- Read the Sky130 Liberty file (timing/power library) ---
read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# --- Read the gate-level netlist produced by Yosys in Stage 2 ---
read_verilog ../synth/uart_synth.v

# --- Elaborate the design, set UART as top module ---
link_design UART

# --- Apply timing constraints ---
read_sdc ../constraints/uart_50mhz.sdc

# --- Reports ---
# Full timing report, worst path first (setup analysis, the default)
report_checks -path_delay max -format full_clock_expanded

# Summary: worst slack across the whole design
report_worst_slack -max

# Hold check (min delay analysis) as well, for completeness
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -min