

difference() {
    cube([13,3.2,1.4],false);
    translate([-0.5,(3.2-1)/2,1.4-0.5]) cube([14,1,1],false);
    translate([-0.4,0.4,0.4]) cube([14,3.2-0.8,0.6],false);
}
translate([6,(3.2-1)/2,0]) cube([1,1,3],false);
translate([6,0,0]) cube([1,3.2,1.4],false);
