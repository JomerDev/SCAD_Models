module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}


module base() {
    union() {
        difference() {
            cube([100,3.4,6.2],false);
            translate([0,0,0]) cube([43,0.7,6.2],false);
            translate([0,3.4-0.7,0]) cube([43,0.7,6.2],false);
            translate([100-43,0,0]) cube([43,0.7,6.2],false);
            translate([100-43,3.4-0.7,0]) cube([43,0.7,6.2],false);
        }
        #rotate([0,90,0]) translate([-3.4,100-43,0]) triangle(3.4,0.7,10);
    }
}

// difference() {
//     cube([11.3,3.3,6.2],false);
// }

difference() {
    base();
    // rotate([0,0,90]) translate([0,-43,0]) triangle(3.4,43,6.2-2.5);
    rotate([0,0,-90]) translate([-3.4,100-43,0]) triangle(3.4,43,6.2-2.5);
}

