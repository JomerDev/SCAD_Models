include <BOSL2/constants.scad>
include <BOSL2/std.scad>

$fn = 30;

module Teil() {

    // Unten
    translate([0.25,0,0]) {
        cube([15,1,0.25], false);
        cube([15,0.25,1], false);
    }

    // Oben
    translate([0.25,0,6.75]) {
        cube([15,1,0.25], false);
        translate([0,0,-0.75]) cube([15,0.25,1], false);
    }

    // Links
    translate([0,-0.25,0]) {
        cube([0.25,1.25,7], false);
        cube([1.25,0.25,7], false);
    }

    // Rechts
    translate([15.25,-0.25,0]) {
        cube([0.25,1.25,7], false);
        translate([-1,0,0]) cube([1.25,0.25,7], false);
    }
}

module Part() {
    path = [[0,0], [5.57142857,6.5], [7.22142857, 6.5], [1.41785714, 0]];
    translate([14.75,0.5,6.75]) rotate([90,180,0]) linear_extrude(0.25, center=false) polygon(path);

    path2 = [[0,0], [6,7], [7.65, 7], [1.4, 0]];
    translate([0.5,0,0]) rotate([90,0,0]) linear_extrude(0.25, center=false) polygon(path2);

    intersection() {
        translate([14.75,0.25,6.75]) rotate([90,180,0]) linear_extrude(0.25, center=false) polygon(path);
        mirror([1,0,0]) translate([-15.5,0,0]) translate([0.5,0.25,0]) rotate([90,0,0]) linear_extrude(0.25, center=false) polygon(path2);
    }
    

    translate([0.75,0,0.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);
    translate([0.75,0,6.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);

    translate([1.6,0,.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);
    translate([6.8,0,6.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);

    translate([6.9,0.25,.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);
    translate([1.8,0.25,6.5]) rotate([90,0,0])  cyl(l=0.7,d=0.3, rounding=0.1);

    translate([4.3,0.125,3.5]) rotate([90,0,0])  cyl(l=0.95,d=0.3, rounding=0.1);
}

Teil();
Part();
mirror([1,0,0]) translate([-15.5,0,0]) Part();

