module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}


// difference() {
//     translate([0,-3,0]) cube([5,16.5+6,1.5],false);
//     translate([2.5,16.5/2,0]) rotate([0,0,0]) cylinder(2,d=1,$fn=180,true);
// }
// translate([0,0,-1.5]) cube([5,2,1.5],false);
// translate([0,16.5-2,-1.5]) cube([5,2,1.5],false);

// translate([5,-3,1.5]) rotate(90) triangle(2,4,13.5);
// translate([0,-3,1.5]) cube([1,2,13.5],false);

// translate([5,16.5+1,1.5]) rotate(90) triangle(2,4,13.5);
#translate([12-(2-0.45),5.5/2,-(3.5-2.1)/2]) rotate([0,0,0]) cylinder(3.5,d=0.9,$fn=180,true);
translate([0,0,0]) cube([12,5.5,2.1],false);
difference() {
    translate([0,0,0]) cube([1.5,5.5,5],false);
    translate([0,2.5/2,0]) cube([1.2,3,5],false);
}
