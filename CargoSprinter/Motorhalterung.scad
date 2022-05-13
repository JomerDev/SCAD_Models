module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

cube([79,22.5,1],false);
cube([2,22.5,6],false);
translate([-6,1,1]) cube([6,20.5,2],false);
translate([-6,3,3]) rotate(-90) triangle(1,6,3);
translate([-6,22.5-2,3]) rotate(-90) triangle(1,6,3);
translate([79-14.5,0,1]) cube([2.5,22.5,3],false);
