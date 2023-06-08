include <BOSL2n/constants.scad>
include <BOSL2n/std.scad>
include <BOSL2n/rounding.scad>
include <BOSL2n/gears.scad>

$fn = 20;

module Servomount() {
    diff("hole")
    cuboid([34,34.2, 5]) {
        attach(FRONT + CENTER, BACK) translate([-13.75,-1,0]) cuboid([6.5,5,3], rounding=1, edges=[LEFT + FRONT, RIGHT + FRONT]) {
            tag("hole") attach(TOP + CENTER, BOTTOM) down(3) translate([0,0,0]) cyl(3,d=3);
            difference() {
                edge_profile_asym([BACK + TOP, BACK + RIGHT], flip=true, corner_type="round") xflip() mask2d_roundover(2);
                attach(TOP + CENTER, BOTTOM) translate([0,0,0]) cyl(1,d=3);
            }
        }
        attach(BACK + CENTER, BACK) translate([13.75,-1,0]) cuboid([6.5,5,3], rounding=1, edges=[LEFT + FRONT, RIGHT + FRONT]) {
            tag("hole") attach(TOP + CENTER, BOTTOM) down(3) translate([0,0,0]) cyl(3,d=3);
            difference() {
                edge_profile_asym([BACK + TOP, BACK + LEFT], flip=true, corner_type="round") xflip() mask2d_roundover(2);
                attach(TOP + CENTER, BOTTOM) translate([0,0,0]) cyl(1,d=3);
            }
        }
        attach(RIGHT + CENTER, BACK) translate([0,-1,0]) cuboid([6.5,5,3], rounding=1, edges=[LEFT + FRONT, RIGHT + FRONT]) {
            tag("hole") attach(TOP + CENTER, BOTTOM) down(3) translate([0,0,0]) cyl(3,d=3);
            difference() {
                edge_profile_asym([BACK + TOP, BACK + RIGHT, BACK + LEFT], flip=true, corner_type="round") xflip() mask2d_roundover(2);
                attach(TOP + CENTER, BOTTOM) translate([0,0,0]) cyl(1,d=3);
            }
        }
        tag("hole") attach(TOP + CENTER, BOTTOM) down(5) translate([-8.2,0,0]) rotate(30) cyl(5,d=17, $fn=6);

        attach(TOP + CENTER, BOTTOM) translate([-13.6 - 6.8 + 20.6,14.7,0]) cuboid([6.8,4.8,13], rounding=3, edges=[TOP + RIGHT]) {
            edge_profile_asym([BOTTOM + RIGHT, BOTTOM + FRONT], flip=false, corner_type="round") xflip() mask2d_roundover(1.5);
            tag("hole") attach(RIGHT, BOTTOM) down(11) cyl(11,d=2);
        }
        attach(TOP + CENTER, BOTTOM) translate([-13.6 - 6.8 + 20.6,-14.7,0]) cuboid([6.8,4.8,13], rounding=3, edges=[TOP + RIGHT]) {
            edge_profile_asym([BOTTOM + RIGHT, BOTTOM + BACK], flip=false, corner_type="round") xflip() mask2d_roundover(1.5);
            tag("hole") attach(RIGHT, BOTTOM) down(11) cyl(11,d=2);
        }

        attach(TOP + CENTER, BOTTOM) translate([-14.7 - 4.6 + 11.4,14.7,0]) cuboid([4.6,4.8,13], rounding=3, edges=[TOP + LEFT]) {
            edge_profile_asym([BOTTOM + LEFT, BOTTOM + FRONT], flip=false, corner_type="round") xflip() mask2d_roundover(1.5);
        }
        attach(TOP + CENTER, BOTTOM) translate([-14.7 - 4.6 + 11.4,-14.7,0]) cuboid([4.6,4.8,13], rounding=3, edges=[TOP + LEFT]) {
            edge_profile_asym([BOTTOM + LEFT, BOTTOM + BACK], flip=false, corner_type="round") xflip() mask2d_roundover(1.5);
        }

        attach(TOP + CENTER, BOTTOM) translate([11,0,0]) cuboid([12,34.2, 1]) {
            edge_profile_asym([BOTTOM + LEFT], flip=false, corner_type="round") xflip() mask2d_roundover(1);
        }
        tag("hole") 
    }

}

module Zahnstange() {
    rack(mod=1.21, teeth=15, thickness=4.3, height=5) {
        position(BOTTOM) cuboid([58.9,5.8,1.1],  rounding=0.5, edges=[LEFT + FRONT, RIGHT + FRONT, LEFT + BACK, RIGHT + BACK], anchor=BOTTOM) {
            diff("hole")
            position(RIGHT) translate([-3,0,7.1/2-0.55]) cuboid([12.3,7.1,7.1], rounding=0.8, edges=[TOP + FRONT, BACK + TOP], anchor=LEFT) {
                tag("hole") attach(RIGHT, BOTTOM) translate([0,0,-5.3]) cyl(5.3,d=4);
                tag("hole") attach(RIGHT, BOTTOM) translate([0,0,-10.9]) cyl(10.9,d=2);
                tag("hole") position(RIGHT) translate([-2.9,0,0]) cyl(7.1,d=1, anchor=CENTER);
                tag("hole") position(RIGHT) rotate([90,0,0]) translate([-2.9,0,0]) cyl(7.1,d=1, anchor=CENTER);
            }
        }
        
    }
}

module Zahnrad() {
    difference() {
        spur_gear(mod=1.21, teeth=10, thickness=4, shaft_diam=1.5);
        translate([0,0,-1]) cyl(2,d=4);
    }
    difference() {
        translate([0,0,3.5]) cyl(3,d=7.8);
        translate([0,0,3.5]) cyl(3,d=4.8);
    }
}

Servomount();

// translate([0,0,6.8]) rotate([90,107, 0]) 
// Zahnrad();
// Zahnstange();

// 15.1 10.1