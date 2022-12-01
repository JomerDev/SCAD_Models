module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

height = 28; //13.5;

difference() {
    translate([0,-3,0]) cube([5,16.5+6,2],false);
    translate([2.5,16.5/2,0]) cylinder(2,d=1.5,$fn=180,true);
    translate([2.5,16.5/2,1.5]) cylinder(0.5,d=3,$fn=180,true);
}
// translate([0,0,-1.5]) cube([5,2,1.5],false);
// translate([0,16.5-2,-1.5]) cube([5,2,1.5],false);

translate([5,-3,2]) rotate(90) triangle(2,4,height);
translate([0,-3,2]) cube([1,2,height],false);

translate([5,16.5+1,2]) rotate(90) triangle(2,4,height);
translate([0,16.5+1,2]) cube([1,2,height],false);