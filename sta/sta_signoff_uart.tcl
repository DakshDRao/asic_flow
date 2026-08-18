# OpenSTA post-layout signoff script for UART
# Stage 8: real, parasitics-aware timing signoff -- the first fully
# trustworthy timing result in this flow, using actual extracted RC data
# from Stage 7's routed geometry instead of any estimate.

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Final routed netlist: real placement, real CTS buffers, real routing.
read_verilog ../pnr/uart_routed_tapfill.v
link_design UART

read_sdc ../constraints/uart_50mhz.sdc

# --- Real extracted parasitics -------------------------------------------
# The key difference from every earlier STA run: measured RC from the
# routed geometry, not an ideal-wire assumption or a wireload estimate.
read_spef ../pnr/uart_routed_tapfill.spef

# --- Setup (max delay) ---------------------------------------------------
report_checks -path_delay max -format full_clock_expanded
report_worst_slack -max

# --- Hold (min delay) ----------------------------------------------------
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -min

# --- Clock skew, now from real extracted clock-network parasitics --------
report_clock_skew

# --- Design-wide margin summary ------------------------------------------
report_tns
report_wns