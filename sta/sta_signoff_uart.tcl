# OpenSTA post-layout signoff script for UART
# Stage 8: real, parasitics-aware timing signoff -- the first fully
# trustworthy timing result in this entire flow, using actual extracted
# RC data from Stage 7's routed geometry instead of any estimate.

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the final routed netlist (reflects real cell placement, real
# clock tree buffers, real routing -- the complete physical design)
read_verilog ../pnr/uart_routed.v
link_design UART

read_sdc ../constraints/uart_50mhz.sdc

# --- Read real extracted parasitics ---
# This is the key difference from every previous STA run in this
# project: real RC data from Stage 7's routed geometry, not an
# estimate or an ideal-wire assumption.
read_spef ../pnr/uart_routed.spef

# --- Full signoff timing reports ---
report_checks -path_delay max -format full_clock_expanded
report_worst_slack -max

report_checks -path_delay min -format full_clock_expanded
report_worst_slack -min

# --- Clock skew, now based on real extracted clock network parasitics
# rather than Stage 6's estimated wire model ---
report_clock_skew

# --- Summary reports: total/worst negative slack across every timing
# endpoint, not just the single worst path -- gives a fuller picture
# of margin distribution across the whole design ---
report_tns
report_wns