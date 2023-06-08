include <BOSL2/constants.scad>
include <BOSL2/std.scad>
include <BOSL2/rounding.scad>

difference() {
    union() {
        cuboid([10.6, 13.7, 2], rounding=0.3, edges=[TOP, LEFT + FRONT, RIGHT + FRONT, LEFT + BACK, RIGHT + BACK], $fn=180);
        translate([0,-0.4,2.75]) cyl(3.5,d=8, $fn=180); 
    }
    translate([0,-0.4,-0.25]) cyl(1.5,d=9.3, $fn=180); 
    translate([0,-0.4,2.75]) cyl(4,d=4, $fn=180); 
    translate([0,-0.4,2]) cyl(3.5,d=2.5, $fn=180); 
    translate([0,13.7/2-1.65,-0.25]) cube([9.5,0.5,1.5], true); 
    translate([0,13.7/2-1.9,-0.25]) cube([1.6,2,1.5], true); 
    translate([0,13.7/2-1.15,-0.25]) cube([7.6,0.5,1.5], true); 
    translate([10.6/2 - 1.3,-13.7/2+1.3,-0.25]) cyl(1.5,d=1, $fn=180); 
    translate([-10.6/2 + 1.3,-13.7/2+1.3,-0.25]) cyl(1.5,d=1, $fn=180); 
    translate([10.6/2 - 1.3,13.7/2-2.8,-0.25]) cyl(1.5,d=1, $fn=180); 
    translate([-10.6/2 + 1.3,13.7/2-2.8,-0.25]) cyl(1.5,d=1, $fn=180); 
}