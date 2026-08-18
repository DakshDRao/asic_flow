read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
read_lef /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
read_def uart_placed.def

# Insert tap cells (well ties + latch-up prevention + well anchoring)
tapcell -distance 14 -tapcell_master sky130_fd_sc_hd__tapvpwrvgnd_1

# CRITICAL: legalize after tap insertion. This moves any logic cells that
# now overlap a tap into the nearest free site, resolving DPL-0033 overlaps.
detailed_placement

# Now fill remaining gaps for nwell/implant continuity
filler_placement "sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8"

# Verify -- should now pass
check_placement

write_def uart_placed_tapfill.def
puts "=== tapfill DEF written ==="
