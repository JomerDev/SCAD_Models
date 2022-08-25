difference(){
    cube([14,26,1.5],false);
    translate([-1,6,-0.25]) cube([11,14,2],false);
    translate([11.5,2,-0.25]) cylinder(2,d=2,$fn=180,true);
    translate([11.5,24,-0.25]) cylinder(2,d=2,$fn=180,true);
}
cube([9,1.7,5],false);
translate([0,24.3,0]) cube([9,1.7,5],false);
translate([14-2.75,4.1+0.75,0]) cylinder(2.5,d=1.5,$fn=180,true);
translate([14-2.75,26-4.1-0.75,0]) cylinder(2.5,d=1.5,$fn=180,true);