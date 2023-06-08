
module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

cube([50, 29, 4], true);


difference() {
    union() {
        translate([10.5,-6.9,2]) triangle(5, 10,17);
        translate([-15.5,-6.9,2]) triangle(5, 10,17);

        rotate(180) translate([10.5,-14.5,2]) triangle(5, 10,17);
        rotate(180) translate([-15.5,-14.5,2]) triangle(5, 10,17);
    }
    translate([0,3.8,18]) cube([32,20,2], true);
}

translate([-14.25,3.8,9.5]) cube([2.5,1.5,15], true);
translate([14.25,3.8,9.5]) cube([2.5,1.5,15], true);

