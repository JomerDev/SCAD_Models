include <BOSL2/constants.scad>
include <BOSL2/std.scad>


box_height = 12.3;
box_width = 7;
box_depth = 4;

box_door_height = 10.5;
box_door_width = box_width - 0.2;
box_door_depth = 0.1;

box_door_offset = -(box_height - box_door_height)/2 + 0.1;

box_door_handle_width = 0.8;
box_door_handle_depth = 0.3;
box_door_handle_height = 0.15;


module FernsprecherBox() {
    difference() {
        union() {
            cube([box_width, box_depth, box_height],true);
            color("#FF0000") translate([0,box_depth/2 + box_door_depth/2, box_door_offset]) cuboid([box_door_width, box_door_depth, box_door_height], rounding=0.3, edges=[TOP + LEFT, TOP + RIGHT, BOTTOM + LEFT, BOTTOM + RIGHT], $fn=180);
            translate([box_door_width/2 - box_door_handle_width/2, box_depth/2 + box_door_depth + box_door_handle_depth/2, -box_door_height/2 + box_door_offset + 3.6]) cuboid([box_door_handle_width, box_door_handle_depth, box_door_handle_height], rounding=0.075, edges=[BACK], $fn=180);
        }
    }
}

FernsprecherBox();