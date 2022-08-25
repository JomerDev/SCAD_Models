module drehzapfen(){
    translate([-6.25,-4,0]) {
        difference() {
            cube([2.5,8,1], false);
            translate([2.5/2,1,-0.25]) cylinder(2,d=1,$fn=180,true);
            translate([2.5/2,7,-0.25]) cylinder(2,d=1,$fn=180,true);
        }

        translate([10,0,0]) difference() {
            cube([2.5,8,1], false);
            translate([2.5/2,1,-0.25]) cylinder(2,d=1,$fn=180,true);
            translate([2.5/2,7,-0.25]) cylinder(2,d=1,$fn=180,true);
        }
        translate([0,2,1]) difference() {
            cube([12.5,4,2],false);
            translate([2.5,-0.5,-0.5]) cube([12.5-5,5,1],false);
        }
        translate([12.5/2,4,3]) cylinder(1.25,d=3,$fn=180,true);
        translate([12.5/2,4,5.25]) cylinder(1,d=3,$fn=180,true);
        translate([12.5/2,4,4.25]) cylinder(1,d=2,$fn=180,true);
    }
}

module aufhaengung() {
    translate([0,0,3]) {
        difference() {
            translate([-17.4/2,-2,0.2]) cube([17.4,4,1],false);
            translate([0,0,-0.2]) cylinder(1.5,d=3.1,$fn=180,true);
        }
    }
    translate([-8.2,0,1.75]) cube([1,4,3.5], true);
    translate([8.2,0,1.75]) cube([1,4,3.5], true);
}

rotate(33) drehzapfen();
aufhaengung();