module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module mount_base() {
    difference() {
        cube([42,19,8], false);
        translate([(42-36)/2,(19-12.6)/2,0]) cube([36,12.6,8-3.8], false);
        translate([(42-23)/2,(19-12.6)/2,0]) cube([23,12.6,8], false);
        translate([7,19/2,3.5]) cylinder(5,d=2,$fn=180,true);
        translate([35,19/2,3.5]) cylinder(5,d=2,$fn=180,true);
    }

    translate([42-3,0,-(15-8)]) cube([3,19,15], false);
    difference() {
        translate([42-3,0,-(15-8)]) cube([13,19,3], false);
        translate([42+4.8,19/2,-7.5]) cylinder(4,d=4,$fn=180,true);
    }

    translate([42+10,0,-(15-11)]) rotate(90) triangle(3,9,9);
    translate([42,0,-(15-11)]) cube([1,3,9], false);

    translate([42+10,16,-(15-11)]) rotate(90) triangle(3,9,9);
    translate([42,16,-(15-11)]) cube([1,3,9], false);


    translate([0,0,-(15-8)]) cube([3,19,15], false);
    difference() {
        translate([-10,0,-(15-8)]) cube([13,19,3], false);
        translate([-4.8,19/2,-7.5]) cylinder(4,d=4,$fn=180,true);
    }

    translate([-10,3,-(15-11)]) rotate(-90) triangle(3,9,9);
    translate([-1,0,-(15-11)]) cube([1,3,9], false);

    translate([-10,19,-(15-11)]) rotate(-90) triangle(3,9,9);
    translate([-1,16,-(15-11)]) cube([1,3,9], false);
}

module servo_axis(){
    translate([26.5,19/2,0]) cylinder(r=1, h=10, center=true);
}

module slider_straight(){
    translate([26.5,19/2,0]) rotate(0) {
        difference() {
            translate([-26.50,-23/2,-7]) cube([20,23,15], false);
            translate([-23.5,-19/2+1,-8]) cube([17,17,17], false);
            translate([-17.5,-23/2,-3]) cube([6,23,3], false);
            translate([-17.5,-23/2,-3]) cube([6,23,3], false);
        }
        difference() {
            union(){
                translate([-19.50,11.5,-3]) cube([10,10,5], false);
                translate([-19.50,11.5,2]) cube([10,4,6], false);
                translate([-9.50,21.5,2]) rotate(180) triangle(10,6,6);
            }
            translate([-17.5,11.5,-3]) cube([6,23,3], false);
            translate([-15.5,11.5,-3]) cube([2,10,11], false);
        }

        difference() {
            union(){
                translate([-19.50,-21.5,-3]) cube([10,10,5], false);
                translate([-19.50,-15.5,2]) cube([10,4,6], false);
                translate([-19.50,-21.5,2]) triangle(10,6,6);
            }
            translate([-17.5,-21.5,-3]) cube([6,23,3], false);
            translate([-15.5,-21.5,-3]) cube([2,10,11], false);
        }
    }
}

module slider_left(){
    translate([26.5,19/2,0]) rotate(90) {
        difference() {
            union(){
                translate([-19.50,8.5,-3]) cube([10,13,5], false);
                translate([-19.50,8.5,-5]) cube([10,2,2], false);
                translate([-13.50,8.5,2]) cube([4,13,6], false);
                translate([-19.50,21.5,2]) rotate(-90) triangle(13,6,6);
            }
            translate([-17.5,8.5,-3]) cube([6,13,3], false);
            translate([-15.5,10.5,0]) cube([2,11,2], false);
            translate([-19.50,10.5,2]) cube([10,3,6], false);
            translate([-19.50,16.5,2]) cube([10,3,6], false);
        }

        difference() {
            union(){
                translate([-19.50,-19.5,-3]) cube([10,11,5], false);
                translate([-19.50,-10.5,-5]) cube([10,2,2], false);
                translate([-13.50,-15.5,2]) cube([4,7,6], false);
                translate([-19.50,-8.5,2]) rotate(-90) triangle(7,6,6);
                translate([-19.50,-16.5,2]) cube([10,1,3], false);
                translate([-19.50,-19.5,2]) triangle(10,3,3);
            }
            translate([-17.5,-21.5,-3]) cube([6,23,3], false);
            translate([-15.5,-19.5,0]) cube([2,9,2], false);
            translate([-19.50,-19.5,2]) rotate([90,0,90]) triangle(4,3,3);
            translate([-19.50,-12.5,2]) cube([10,2,6], false);
        }
    }
}

module slider_right() {
    translate([0,19,0]) mirror([0,1,0]) slider_left();
}


mount_base();
// servo_axis();
// slider_straight();
// slider_left();
slider_right();