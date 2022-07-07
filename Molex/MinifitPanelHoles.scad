function molex_width(pins_per_row=1) = 5.8 + (min(max(1, pins_per_row),12)-1) * 4.2;

function molex_height(rows=2) = 5.8 + (min(max(1, rows),2)-1) * 4.2;

function molex_full_width(pins_per_row) = molex_width(pins_per_row) + 6 + 4;

function molex_full_height(rows) = molex_height(rows) + 1.6;

function molex_width_with_hooks(pins_per_row) = molex_width(pins_per_row) + 6;

function molex_panel_hook_height(rows) = 5.6;

// module minifit_panel_hole(pins="10", depth=2) {
//     if(pins == "2") { 
//         panel_hole(width=5.8,height=10,depth=depth);
//     } else if(pins == "4") {
//         panel_hole(width=10,height=10,depth=depth);
//     } else if(pins == "6") {
//         panel_hole(width=14.2,height=10,depth=depth);
//     } else if(pins == "8") {
//         panel_hole(width=18.4,height=10,depth=depth);
//     } else if(pins == "10") {
//         panel_hole(width=22.6,height=10,depth=depth);
//     } else if(pins == "12") {
//         panel_hole(width=26.8,height=10,depth=depth);
//     } else if(pins == "14") {
//         panel_hole(width=31.1,height=10,depth=depth);
//     } else if(pins == "16") {
//         panel_hole(width=35.3,height=10,depth=depth);
//     } else if(pins == "18") {
//         panel_hole(width=39.5,height=10,depth=depth);
//     } else if(pins == "20") {
//         panel_hole(width=43.7,height=10,depth=depth);
//     } else if(pins == "22") {
//         panel_hole(width=47.9,height=10,depth=depth);
//     } else if(pins == "24") {
//         panel_hole(width=52.1,height=10,depth=depth);
//     } 
// }


panel_hook_height = molex_panel_hook_height();

module minifit_panel_hole(pins_per_row=5, rows=2, depth=2) {
    width = molex_width(pins_per_row);
    height = molex_height(rows);
    
    panel_hook_width = molex_width_with_hooks(pins_per_row);

    hook_width = 4;
    hook_height = height + 1.6;

    translate([-(height/2),-(width/2),-(depth/2)]) cube([height,width,depth],false);
    translate([-(panel_hook_height/2),-(panel_hook_width/2),-(depth/2)]) cube([panel_hook_height,panel_hook_width,depth],false);
    translate([-(height/2),-(hook_width/2),-(depth/2)]) cube([hook_height,hook_width,depth],false);
}

module minifit_panel_hole_sides(pins_per_row=5, rows=2, depth=2) {
    width = molex_full_width(pins_per_row);
    cube([panel_hook_height, width, 2], true);
}

// 4,2 width plus per extra pin
// 