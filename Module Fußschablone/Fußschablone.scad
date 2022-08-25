
difference() {
    cube([40,4,145],false);
    translate([30,4.5,20]) rotate([90,0,0]) cylinder(5,d=8,$fn=180,true);
    translate([30,4.5,135]) rotate([90,0,0]) cylinder(5,d=8,$fn=180,true);
}
translate([-3,-12,-3]) cube([40+3,28,3],false);
translate([-3,-12,0]) cube([3,28,145],false);
