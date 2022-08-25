function molex_width(pins_per_row=1) = 5.8 + (min(max(1, pins_per_row),12)-1) * 4.2;

function molex_height(rows=2) = 5.8 + (min(max(1, rows),2)-1) * 4.2;

function molex_full_width(pins_per_row) = molex_width(pins_per_row) + 6 + 4;

function molex_full_height(rows) = molex_height(rows) + 1.6;

function molex_width_with_hooks(pins_per_row) = molex_width(pins_per_row) + 5;

function molex_panel_hook_depth(rows) = rows == 2 ? 5.6 : 3.2;

panel_hook_depth = molex_panel_hook_depth();

module minifit_panel_hole(pins_per_row=5, rows=2, depth=2) {
    width = molex_width(pins_per_row);
    height = molex_height(rows);
    
    panel_hook_width = molex_width_with_hooks(pins_per_row);

    hook_width = 4;
    hook_height = height + 1.6;

    translate([-(height/2),-(width/2),-(depth/2)]) cube([height,width,depth],false);
    translate([-(panel_hook_depth/2),-(panel_hook_width/2),-(depth/2)]) cube([panel_hook_depth,panel_hook_width,depth],false);
    translate([-(height/2),-(hook_width/2),-(depth/2)]) cube([hook_height,hook_width,depth],false);
}

module minifit_panel_hole_sides(pins_per_row=5, rows=2, depth=2) {
    width = molex_full_width(pins_per_row);
    cube([panel_hook_depth, width, 2], true);
}