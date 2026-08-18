# Magic DRC script for UART
# Stage 9a: Design Rule Check -- verifies every shape in the routed
# layout obeys Sky130's manufacturing rules (min width, min spacing,
# enclosure, via rules, etc.)

# Load the Sky130 technology file (encodes all DRC rules for this PDK)
tech load /home/daksh/pdk/sky130A/libs.tech/magic/sky130A.tech

# Tell Magic where to find the actual standard cell layout views
# (.mag files) referenced by name in the DEF -- without this, Magic
# can't resolve cell instances to real geometry, and DRC would only
# be checking routing wires, not the complete layout.
addpath /home/daksh/pdk/sky130A/sky130_fd_sc_hd/mag

# Read the tech LEF and cell LEF explicitly. The .tech file alone does
# not carry full via geometry definitions -- without these LEF reads,
# Magic doesn't recognize router-generated via names like M1M2_PR /
# L1M1_PR_MR (real, legitimate Sky130 via names OpenROAD's TritonRoute
# generates), causing cascading "unknown in route" errors on DEF read.
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef
lef read /home/daksh/pdk/sky130A/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef

# Read the routed DEF from Stage 7 -- this pulls in real physical
# geometry (cell placements, routed wires, vias, power grid) that
# Magic can check against the loaded technology rules.
def read ../pnr/uart_routed.def

# Select the whole layout for checking
select top cell
expand

# Run DRC across the entire loaded layout
drc check
drc catchup

# Print a count of violations found -- this command is confirmed working
set drc_count [drc list count total]
puts "Total DRC violations found: $drc_count"

# Walk through violations one at a time using the confirmed drc find/why
# commands (from Magic's own "drc help" output) and print each reason.
# We cap the loop as a safety net in case "find" doesn't terminate
# cleanly, but expect it to naturally run out of violations first.
set max_report 2000
set found_count 0
for {set i 0} {$i < $max_report} {incr i} {
    set result [drc find]
    if {$result == ""} {
        break
    }
    puts "--- Violation [expr {$i + 1}] ---"
    puts [drc why]
    incr found_count
}
puts "Reported $found_count violation location(s) via drc find/why."

quit -noprompt