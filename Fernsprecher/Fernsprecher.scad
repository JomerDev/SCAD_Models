include <BOSL2/constants.scad>
include <BOSL2/std.scad>
include <BOSL2/rounding.scad>


box_height = 10.1; //12.3;
box_width = 7;
box_depth = 4;

box_door_height = 9.9; //10.5;
box_door_width = box_width - 0.2;
box_door_depth = 0.1;

box_door_offset = -(box_height - box_door_height)/2 + 0.1;

box_door_handle_width = 0.8;
box_door_handle_depth = 0.3;
box_door_handle_height = 0.15;


module FernsprecherBox() {
    difference() {
        color("#CCCCCC") union() {
            cube([box_width, box_depth, box_height],true);
            translate([0,box_depth/2 + box_door_depth/2, box_door_offset]) cuboid([box_door_width, box_door_depth, box_door_height], rounding=0.3, edges=[TOP + LEFT, TOP + RIGHT, BOTTOM + LEFT, BOTTOM + RIGHT], $fn=180);
            translate([box_door_width/2 - box_door_handle_width/2, box_depth/2 + box_door_depth + box_door_handle_depth/2, -box_door_height/2 + box_door_offset + 3.6]) cuboid([box_door_handle_width, box_door_handle_depth, box_door_handle_height], rounding=0.075, edges=[BACK], $fn=180);
        }
    }

    path = [[0,-box_width/2], [0,box_width/2], [1, 0]];
    color("#CCCCCC") translate([0,0,box_height/2]) rotate([0,-90,90]) linear_extrude(box_depth, center=true) polygon(round_corners(path, cut = [0, 0, 0.2], method="circle"));
}

module Legs() {
    side = 1.3 + 1.3/2;
    color("#CCCCCC") translate([side,-1.3/2 - 2,-8.1/2]) cube([1.3,1.3,18.2], true); 
    color("#CCCCCC") translate([-side,-1.3/2 - 2,-8.1/2]) cube([1.3,1.3,18.2], true); 

    color("#CCCCCC") translate([0,-2,-8.1 - 5.05 - 1]) cube([5.2,5.2,2], true); 
    color("#CCCCCC") translate([0,-2,-8.1 - 5.05 - 1 - 3]) cyl(6,r=1, rounding=1, $fn=180); 
    color("#CCCCCC") translate([0, -box_depth/2 + 0.1, -box_height/2 - 1.5 - 1]) cuboid([5, 0.2, 3], rounding=0.3, edges=[TOP + LEFT, TOP + RIGHT, BOTTOM + LEFT, BOTTOM + RIGHT], $fn=180);
    color("#CCCCCC") translate([0,-box_depth/2 + 0.5,-box_height/2 - 1.5 - 1]) cube([2.6,1,3.5], true); 
    // color("#00FF00") translate([10,0,0]) prismoid(size1=[2.6,2.6], size2=[0,2.6], h=1);

    // path = [[0, 0],[2.6, 0],[2.6, 2.6]];
    // polygon(round_corners(path,cut = [0,0,0], method="circle", verbose=true));
    color("#CCCCCC") translate([0,-box_depth/2 - 0.05,box_height/2 - 0.5 - 2]) cube([box_width - 0.2,0.1,1], true);
    color("#CCCCCC") translate([0,-box_depth/2 - 0.05,-box_height/2 + 0.5 + 2.5]) cube([box_width - 0.2,0.1,1], true);
    color("#CCCCCC") translate([side,-box_depth/2 - 0.7,-box_height/2 + 0.5 + 2.5]) cube([1.5,1.4,1], true);
    color("#CCCCCC") translate([-side,-box_depth/2 - 0.7,-box_height/2 + 0.5 + 2.5]) cube([1.5,1.4,1], true);
    color("#CCCCCC") translate([side,-box_depth/2 - 0.7,box_height/2 - 0.5 - 2]) cube([1.5,1.4,1], true);
    color("#CCCCCC") translate([-side,-box_depth/2 - 0.7,box_height/2 - 0.5 - 2]) cube([1.5,1.4,1], true);


    path = [[0,-1.5], [0,1.75], [0.5, 0]];
    color("#CCCCCC") translate([0,-box_depth/2 + 1,-box_height/2 - 1.5 - 1]) rotate([90,0,90]) linear_extrude(2.6, center=true) polygon(round_corners(path, cut = [0, 0, 0.2], method="circle"));
}


FernsprecherBox();
Legs();