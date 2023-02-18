width = 45.1;
height = 77.5;
depth = 3;

$fn=100;

difference() {
    cube([width, height, depth], false);
    translate([10,0,0]) cube([width - 20, 12.5, depth], false);
    translate([10,12.5+13,0]) cube([width - 20, 20, depth], false);
    translate([width/2,12.5+13,8]) sphere(7);
    translate([6.5,height-20,0]) cube([3, 20, depth], false);
    translate([width-9.5,height-20,0]) cube([3, 20, depth], false);
    translate([9,height-5.5,2]) cube([width-18, 4, 2], false);
}

translate([-2,height-0.25,depth-0.5]) rotate([0,90,0]) cylinder(8.5,d=2.8, false);
#translate([-2,height-0.25,depth-0.5]) sphere(d=2.8);

translate([0,height-10,depth-0.5]) rotate([0,90,0]) cylinder(2,d=2.8, false);
translate([0,height-10,depth-0.5]) sphere(d=2.8);

translate([width-6.5,height-0.25,depth-0.5]) rotate([0,90,0]) cylinder(8.5,d=2.8, false);
translate([width+2,height-0.25,depth-0.5]) sphere(d=2.8);

translate([width-2,height-10,depth-0.5]) rotate([0,90,0]) cylinder(2,d=2.8, false);
translate([width,height-10,depth-0.5]) sphere(d=2.8);

translate([9.5,height+0.5,depth+0.25]) rotate([0,90,0]) cylinder(8,d=2, false);
translate([width-8-9.5,height+0.5,depth+0.25]) rotate([0,90,0]) cylinder(8,d=2, false);

difference() {
    union() {
        translate([width-6.5,height-0.25,depth-0.5]) rotate([-27+180,0,0]) translate([0,-1.4,0]) cube([6.5,2.8,5], false);
        translate([0,height-0.25,depth-0.5]) rotate([-27+180,0,0]) translate([0,-1.4,0]) cube([6.5,2.8,5], false);

        translate([width-8-9.5,height+0.5,depth+0.25]) rotate([-27+180,0,0]) translate([0,-1,0]) cube([8,2,6], false);
        translate([9.5,height+0.5,depth+0.25]) rotate([-27+180,0,0]) translate([0,-1,0]) cube([8,2,6], false);
    }
    translate([0,0,-depth]) cube([width, height*2,depth]);
}