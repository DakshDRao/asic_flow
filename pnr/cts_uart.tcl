# OpenROAD CTS script for UART
# Stage 6: Clock Tree Synthesis -- build a buffered, balanced clock
# distribution network to all 31 flip-flops using TritonCTS

read_liberty /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# Resume from Stage 5's placed design
read_def ../pnr/uart_placed.def

read_sdc ../constraints/uart_50mhz.sdc

# --- Set up clock buffer list ---
# TritonCTS needs to know which standard cells it's allowed to use as
# clock buffers when building the tree. We use Sky130 HD's dedicated
# clock buffer/inverter cells (clkbuf / clkinv variants are specifically
# characterized for balanced, low-skew clock distribution, as opposed
# to generic buf/inv cells used for regular signal paths).
set_wire_rc -clock -layer met3

clock_tree_synthesis -root_buf sky130_fd_sc_hd__clkbuf_4 \
    -buf_list {sky130_fd_sc_hd__clkbuf_1 sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8} \
    -sink_clustering_enable

# --- Post-CTS legalization ---
# CTS inserts new buffer cells into the design, which can create new
# overlaps -- detailed placement needs to re-run to legalize them.
detailed_placement
check_placement -verbose

# --- Real, clock-tree-aware timing check ---
# This is the first STA checkpoint using an actual buffered, non-ideal
# clock network instead of the ideal-clock assumption used in Stages 3-5.
report_clock_skew
report_worst_slack -max
report_worst_slack -min

# --- Reports ---
report_design_area

# --- Write outputs ---
write_def uart_cts.def
write_verilog uart_cts.v
add_global_connection -net VPWR -pin_pattern {^VPWR$} -power
add_global_connection -net VGND -pin_pattern {^VGND$} -ground
add_global_connection -net VPWR -pin_pattern {^VPB$}  -power
add_global_connection -net VGND -pin_pattern {^VNB$}  -ground
global_connect