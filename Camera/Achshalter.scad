
use <wheels.scad>;

// #wheelsAssembled();

module Achshalter() {
    difference() {
        translate([0,0,-9]) cube([8,30,3], true);
        translate([0,5,-11]) cylinder(4,d=3,$fn=180,true);
        translate([0,-5,-11]) cylinder(4,d=3,$fn=180,true);
    }
    difference() {
        union() {
            translate([0,30/2 - 1.7,-2.5]) cube([8,3.4,11], true);
            translate([0,-30/2 + 1.7,-2.5]) cube([8,3.4,11], true);
        }
        wheelsAssembled();
        translate([0,-23/2,2]) cube([1,0.7,4], true);
        translate([0,23/2,2]) cube([1,0.7,4], true);
    }
}

Achshalter();