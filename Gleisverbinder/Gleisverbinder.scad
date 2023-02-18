include <BOSL2/std.scad>


module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module schienenlasche() {
    difference() {
        cube([5,3.2,1.4],true);
        translate([0,0,0.5]) cube([14,1,1],true);
        translate([0,0,0]) cube([14,3.2-0.8,0.6],true);
    }
}

difference() {
    union() {
        cube([5,30,2.1],true);
        translate([0,14,1.45]) cube([5,2,5], true);
        translate([0,11.5,0.5]) cube([5,4,3], true);
        rotate([0,0,180]) translate([0,14,1.45]) cube([5,2,5], true);
        rotate([0,0,180]) translate([0,11.5,0.5]) cube([5,4,3], true);
        translate([-2.5,11,1.95]) triangle(5,2,2);
        translate([-2.5,15,1.95+2]) rotate([-90,0,0]) triangle(5,5,5);
        rotate([0,0,180]) translate([-2.5,11,1.95]) triangle(5,2,2);
        rotate([0,0,180]) translate([-2.5,15,1.95+2]) rotate([-90,0,0]) triangle(5,5,5);
    }
    translate([-2.5,14,1.45]) rotate([0,90,0]) cylinder(5, d=3,$fn=180);
}

translate([2.5,-14,1.45]) rotate([0,90,0]) cyl(5, d=3, chamfer=0.75, $fn=180);

translate([0,16.5/2,1.3]) schienenlasche();
translate([0,-16.5/2,1.3]) schienenlasche();
