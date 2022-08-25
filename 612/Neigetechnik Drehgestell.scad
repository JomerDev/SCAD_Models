module drehzapfen(){
    translate([-4,-3.5/2,0]) difference() {
        cube([8,3.5,14],false);
        rotate([90,0]) translate([4,3,-3.75]) cylinder(4,d=2,$fn=180,true);
        translate([-0.5,3.5-0.9,-0.1]) cube([9,1,7.3],false);
    }
    translate([0,0,14]) cylinder(1.25,d=5.5,$fn=180,true);
    translate([0,0,16.25]) cylinder(1,d=5.5,$fn=180,true);
    translate([0,0,15.25]) cylinder(1,d=4,$fn=180,true);
}

module aufhaengung() {
    translate([0,0,14]) {
        difference() {
            translate([-17.4/2,-5,0.2]) cube([17.4,10,1],false);
            translate([0,0,-0.2]) cylinder(1.5,d=5.6,$fn=180,true);
        }
    }
    translate([-8.2,0,12.5]) cube([1,10,3.5], true);
    translate([8.2,0,12.5]) cube([1,10,3.5], true);
}

// rotate(33) 
// rotate([90,0]) 
drehzapfen();
aufhaengung();