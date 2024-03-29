use <MinifitPanelHoles.scad>

module quarter(h,d, $fn=180,center=true) {

}

module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module MolexSideMount(rows=2) {
    molex_height = molex_full_height(rows);
    height = molex_height + 3 + 2.4 + 4;

    difference() {
        cube([15,3,16],false);
        translate([7,3,8]) rotate([90,0,0]) cylinder(3,d=4,$fn=180,true);
        translate([0,0,8]) rotate([90,0,90]) triangle(3,8,8);
    }
    
    difference() {
        union() {
            translate([12,3,0]) cube([3,height,7], false);
            translate([15,height + 3,7]) rotate(180) triangle(3,height,9);
        }
        rotate(180) translate([-16.5,-height/2 - 2.5,1.5]) MolexMountHolderParts(rows);
    }
    translate([12,height + 3,3]) rotate([0,90,180]) triangle(3,height,12);
}

module MolexBottomMount(pins_per_row=5, rows=2, height_to_bottom = 0) {
    molex_width = molex_full_width(pins_per_row);
    molex_depth = molex_full_height(rows);
    depth = molex_depth + 2.4 + 3 + 4;
    height_to_bottom = 15 + height_to_bottom;

    module holder() { 
        difference() {
            cube([15,depth,3],false);
            translate([5,depth/2,0]) rotate([0,0,0]) cylinder(3,d=4,$fn=180,true);
        }
        translate([12,0,0]) cube([3,depth,height_to_bottom], false);
        translate([12,0,height_to_bottom]) rotate([-90,0,90]) triangle(3,height_to_bottom - 3,12);
        translate([12,depth - 3,height_to_bottom]) rotate([-90,0,90]) triangle(3,height_to_bottom - 3,12);
        translate([0,0,2]) rotate([90,90,0]) triangle(2,13,12);
        translate([13,12 + depth,2]) rotate([180,90,0]) triangle(2,12,13);
        translate([13,-12,0]) cube([2,depth + 24,2],false);
        translate([13,-12,2]) rotate([0,0,0]) triangle(2,12,13);
        translate([15,12 + depth,2]) rotate([0,0,180]) triangle(2,12,13);
    }

    difference() {
        holder();
        rotate([180,0,180]) translate([-16.5,depth/2,-height_to_bottom + 1.5]) MolexMountHolderParts(rows);
    }
    
}

module MolexMountHolderParts(rows=2) {
    molex_depth = molex_full_height(rows);
    depth = molex_depth + 2.4 + 3;

    cube_depth = depth + 3;

    translate([0,cube_depth/2 - 1.5,3.5]) cube([3,3,4],true);
    translate([0,-cube_depth/2 + 1.5,3.5]) cube([3,3,4],true);

    rotate([0,90,0]) translate([-4, -cube_depth/2 + 1.5,1.5]) cylinder(3,d=3,$fn=180,true);
    rotate([0,90,0]) translate([-4, +cube_depth/2 - 1.5,1.5]) cylinder(3,d=3,$fn=180,true);
    translate([3,0,-0.5]) cube([3,cube_depth-10,2],true);
}

module MolexMountHolder(pins_per_row=5, rows=2) {
    molex_width = molex_full_width(pins_per_row);
    molex_depth = molex_full_height(rows);
    depth = molex_depth + 2.4 + 3;

    cube_width = molex_width + 2;
    cube_depth = depth + 3;

    panel_hook_depth = molex_panel_hook_depth();
    difference() {
        cube([cube_width,cube_depth,3],true);
        width_with_hooks = molex_width_with_hooks(pins_per_row);
        translate([0,0,-1]) cube([molex_width, panel_hook_depth, 1], true);
        translate([0,0,0]) rotate(90) minifit_panel_hole(pins_per_row, rows, 3);
    }

    if(pins_per_row > 0) {
        triangle_width = (molex_width-6)/2;
        rotate([0,0,90]) translate([cube_depth/2-3,1,1.5]) triangle(3,triangle_width,4);
        rotate([0,0,-90]) translate([cube_depth/2-3,1,1.5]) triangle(3,triangle_width,4);

        rotate([0,0,90]) translate([-cube_depth/2,1,1.5]) triangle(3,triangle_width,4);
        rotate([0,0,-90]) translate([-cube_depth/2,1,1.5]) triangle(3,triangle_width,4);
    }

    translate([cube_width/2 - 1.5,0,0]) MolexMountHolderParts(rows);
    rotate(180) translate([cube_width/2 - 1.5,0,0]) MolexMountHolderParts(rows);
}

module mirrored() {
    translate([-16,1,0]) MolexSideMount(rows=2);
    mirror([1,0,0]) translate([-16,1,0]) MolexSideMount(rows=2);
    mirror([0,1,0]) translate([-16,1,0]) MolexSideMount(rows=2);
    mirror([1,0,0]) mirror([0,1,0]) translate([-16,1,0]) MolexSideMount(rows=2);
}

// translate([20,-15,0]) for (x =[0:42:170]) {
//     translate([20,0,0]) MolexMountHolder(pins_per_row=12, rows=2);
//     translate([91,0,0]) MolexMountHolder(pins_per_row=12, rows=2);
//     translate([91+71,0,0]) MolexMountHolder(pins_per_row=12, rows=2);
//     translate([16,-22,0]) MolexMountHolder(pins_per_row=10, rows=2);
//     translate([16,-22,0]) MolexMountHolder(pins_per_row=10, rows=2);
//     translate([16,-22,0]) MolexMountHolder(pins_per_row=10, rows=2);
// }
// mirrored();
// translate([21,-30,0]) mirrored();
// translate([0,-60,0]) mirrored();

MolexBottomMount(pins_per_row=12, rows=2, height_to_bottom=12);
// translate([-40,0,0]) MolexMountHolder(pins_per_row=1, rows=2);
// MolexMountHolder(pins_per_row=12, rows=2);