# SDC constraints for UART
# Baseline: 50 MHz, matching the design's own freq parameter (20 ns period)

# --- Primary clock definition ---
# -name: logical clock name used in reports
# -period: clock period in ns (STA works in ns by default for Sky130 Liberty files)
# [get_ports clk]: the actual clock pin in the netlist
create_clock -name clk -period 20.0 [get_ports clk]

# --- Input delay ---
# Models how long after the clock edge external inputs (empty, output_data, rst)
# are assumed to become valid, relative to some external driving logic.
# We don't have real external timing info, so we use a conservative placeholder:
# 20% of the clock period is a common rule-of-thumb default for "unknown external driver".
set_input_delay -clock clk 4.0 [get_ports {empty output_data rst}]

# --- Output delay ---
# Models how long external receiving logic needs the output (tx, read_en) to be
# stable before the *next* clock edge. Same placeholder logic.
set_output_delay -clock clk 4.0 [get_ports {tx read_en}]
