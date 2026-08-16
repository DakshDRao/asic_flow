# OpenSTA script: UART timing analysis, aggressive 2ns period (500MHz)
# Purpose: deliberately push past the design's real speed limit to observe
# and learn to read a genuine setup violation.

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog ../synth/uart_synth.v
link_design UART
read_sdc ../constraints/uart_500mhz.sdc

report_checks -path_delay max -format full_clock_expanded
report_worst_slack -max

report_checks -path_delay min -format full_clock_expanded
report_worst_slack -min