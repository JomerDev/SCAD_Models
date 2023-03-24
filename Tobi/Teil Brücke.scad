include <BOSL2/constants.scad>
include <BOSL2/std.scad>

$fn = 30;

module Teil() {

    // Unten
    translate([0.5,0,0]) {
        cube([14.5,1,0.5], false);
        cube([14.5,0.5,1], false);
    }

    // Oben
    translate([0.5,0,6.5]) {
        cube([14.5,1,0.5], false);
        translate([0,0,-0.5]) cube([14.5,0.5,1], false);
    }

    // Links
    translate([0,0,0]) {
        cube([0.5,1,7], false);
        cube([1,0.5,7], false);
    }

    // Rechts
    translate([15,0,0]) {
        cube([0.5,1,7], false);
        translate([-0.5,0,0]) cube([1,0.5,7], false);
    }
}

module Part() {
    path = [[0,0], [5.14285714,6], [6.775, 6], [1.41785714, 0]];
    translate([14.5,0.75,6.5]) rotate([90,180,0]) linear_extrude(0.25, center=false) polygon(path);

    path2 = [[0,0], [6,7], [7.65, 7], [1.4, 0]];
    translate([0.5,0,0]) rotate([90,0,0]) linear_extrude(0.25, center=false) polygon(path2);

    intersection() {
        translate([14.5,0.5,6.5]) rotate([90,180,0]) linear_extrude(0.5, center=false) polygon(path);
        mirror([1,0,0]) translate([-15.5,0,0]) translate([0.5,0.5,0]) rotate([90,0,0]) linear_extrude(0.5, center=false) polygon(path2);
    }
    

    translate([0.75,0.25,0.75]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);
    translate([0.75,0.25,6.25]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);

    translate([1.8,0.125,.75]) rotate([90,0,0])  cyl(l=0.95,d=0.3, rounding=0.1);
    translate([6.6,0.125,6.25]) rotate([90,0,0])  cyl(l=0.95,d=0.3, rounding=0.1);

    translate([6.7,0.375,.75]) rotate([90,0,0])  cyl(l=0.95,d=0.3, rounding=0.1);
    translate([2,0.375,6.25]) rotate([90,0,0])  cyl(l=0.95,d=0.3, rounding=0.1);

    translate([4.3,0.25,3.5]) rotate([90,0,0])  cyl(l=1.2,d=0.3, rounding=0.1);
}

Teil();
Part();
mirror([1,0,0]) translate([-15.5,0,0]) Part();

