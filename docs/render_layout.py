#!/usr/bin/env python3
"""
Render publication-quality views of a GDSII layout using KLayout's Python API.

    pip install klayout
    python3 docs/render_layout.py signoff/uart.gds docs/

Uses the Sky130 PDK layer-properties file (sky130A.lyp) when it can find it,
so the output matches what you see in the KLayout GUI.  Falls back to a
built-in colour map if the PDK's KLayout tech files were not installed.

Outputs:
    layout_full.png     everything (text labels hidden)
    layout_metal.png    routing metals only
    layout_pdn.png      power distribution: met1 rails + met4 straps
    layout_cells.png    device layers only, no metal
    layout_detail.png   zoomed crop showing individual transistors

Why a script and not GUI screenshots: the images regenerate when the layout
changes, so the README can never drift from the actual GDS.
"""
import os
import sys

import klayout.db as db
import klayout.lay as lay

# --------------------------------------------------------------------------
# Layer sets, as (layer, datatype) pairs.  A GDS stores only these integers --
# names and colours live in a separate .lyp file or in the map below.
# --------------------------------------------------------------------------
MET1, MET2, MET3, MET4 = (68, 20), (69, 20), (70, 20), (71, 20)
VIA1, VIA2, VIA3       = (68, 44), (69, 44), (70, 44)
TEXT                   = (83, 44)

METALS = {MET1, MET2, MET3, MET4, VIA1, VIA2, VIA3}
PDN    = {MET1, MET4}
DEVICE = {(64, 20), (65, 20), (65, 44), (66, 20), (66, 44), (67, 20)}

# Fallback palette, used only when sky130A.lyp cannot be found.
FALLBACK = {
    (64, 20): "#6b6b00",  # nwell
    (65, 20): "#ff7f00",  # diff
    (65, 44): "#c8a000",  # tap
    (66, 20): "#e2001a",  # poly
    (66, 44): "#ffffff",  # licon1
    (67, 20): "#9a9aff",  # li1
    (67, 44): "#ffffff",  # mcon
    MET1:     "#00c8ff",
    VIA1:     "#ffffff",
    MET2:     "#ff00ff",
    VIA2:     "#ffffff",
    MET3:     "#00ff9f",
    VIA3:     "#ffffff",
    MET4:     "#ffd700",
    (93, 44): "#3a3a55",  # nsdm
    (94, 20): "#553a3a",  # psdm
    (95, 20): "#4a4a4a",  # npc
    (78, 44): "#2e2e4a",  # hvtp
    (236, 0): "#808080",  # outline
}

BACKGROUND = "#ffffff"          # white reads better in a README
FALLBACK_BACKGROUND = "#0d0d12"  # dark suits the synthetic palette


def find_lyp():
    """Locate the PDK's KLayout layer-properties file, if it was installed."""
    pdk = os.environ.get("PDK_ROOT", "")
    candidates = [
        f"{pdk}/sky130A/libs.tech/klayout/tech/sky130A.lyp",
        f"{pdk}/sky130A/libs.tech/klayout/sky130A.lyp",
    ]
    for c in candidates:
        if c and os.path.isfile(c):
            return c
    return None


def make_view(gds, keep=None, hide=frozenset()):
    """
    Build a LayoutView.

    keep : set of (layer, datatype) to show exclusively; None = show all
    hide : set of (layer, datatype) to force hidden
    """
    lyp = find_lyp()

    lv = lay.LayoutView()
    lv.set_config("background-color", BACKGROUND if lyp else FALLBACK_BACKGROUND)
    lv.set_config("grid-visible", "false")
    lv.load_layout(gds, 0)

    # Expand the cell hierarchy.  Without this you get cell OUTLINES with
    # their names stamped on them instead of the geometry inside -- the most
    # common reason a rendered layout looks wrong.
    lv.max_hier()

    if lyp:
        # This replaces the entire layer list, including every `visible`
        # flag, so it must happen BEFORE we set visibility below.
        lv.load_layer_props(lyp)

    # Single pass: collect modified properties, then write them back.
    # Mutating while iterating is unreliable, hence the two loops.
    props = []
    it = lv.begin_layers()
    while not it.at_end():
        lp = it.current().dup()
        key = (lp.source_layer, lp.source_datatype)

        visible = True if keep is None else (key in keep)
        if key in hide:
            visible = False
        lp.visible = visible

        if visible and not lyp:
            colour = int(FALLBACK.get(key, "#808080")[1:], 16)
            lp.fill_color = colour
            lp.frame_color = colour
            lp.transparent = False
            lp.dither_pattern = 1          # solid fill

        props.append(lp)
        it.next()

    it = lv.begin_layers()
    for lp in props:
        lv.set_layer_properties(it, lp)
        it.next()

    return lv


def render(gds, out, keep=None, hide=frozenset(), width=2400, box=None):
    lv = make_view(gds, keep, hide)
    if box is None:
        lv.zoom_fit()
        height = width
    else:
        lv.zoom_box(box)                   # db.DBox(x1, y1, x2, y2), microns
        height = int(width * (box.height() / box.width()))
    lv.save_image(out, width, height)
    print(f"  {out}  ({width}x{height})")


def main():
    gds    = sys.argv[1] if len(sys.argv) > 1 else "signoff/uart.gds"
    outdir = sys.argv[2] if len(sys.argv) > 2 else "docs"

    if not os.path.isfile(gds):
        sys.exit(f"error: no such GDS file: {gds}")
    os.makedirs(outdir, exist_ok=True)
    p = lambda n: os.path.join(outdir, n)

    lyp = find_lyp()
    print(f"rendering {gds}")
    print(f"  palette: {lyp if lyp else 'built-in fallback (sky130A.lyp not found)'}")

    # Text labels are enabled by the PDK .lyp and ruin a screenshot.
    render(gds, p("layout_full.png"),  hide={TEXT})
    render(gds, p("layout_metal.png"), keep=METALS)
    render(gds, p("layout_pdn.png"),   keep=PDN)
    render(gds, p("layout_cells.png"), keep=DEVICE)
    # Zoomed crop in microns -- widen or move this for a different design
    render(gds, p("layout_detail.png"), hide={TEXT}, box=db.DBox(8.0, 8.0, 22.0, 18.0))

    print("done")


if __name__ == "__main__":
    main()