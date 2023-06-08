module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

cube([40, 15, 2], true);
translate([1.75 + 1.5, 0, 4]) cube([3, 15, 6], true);
translate([-1.75 + -1.5, 0, 4]) cube([3, 15, 6], true);

rotate(90) translate([-7.5,-4.5 - 5.25,1]) triangle(15,5,6);
rotate(-90) translate([-7.5,-4.5 - 5.25,1]) triangle(15,5,6);

translate([0,0,2]) cube([3.5,15,2], true);