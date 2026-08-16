# SDC constraints for UART -- deliberately aggressive 2ns period (500MHz)
# Purpose: force a setup violation to learn to read a failing timing report

create_clock -name clk -period 2.0 [get_ports clk]

set_input_delay -clock clk 0.4 [get_ports {empty output_data rst}]
set_output_delay -clock clk 0.4 [get_ports {tx read_en}]
