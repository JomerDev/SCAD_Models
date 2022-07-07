use <MinifitPanelHoles.scad>

module triangle(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module MolexSideMount(pins_per_row=5, rows=2) {
    molex_width = molex_full_width(pins_per_row);
    molex_height = molex_full_height(rows);
    height = molex_height + 3 + 2.4;

    difference() {
        cube([15,3,15],false);
        translate([7,3,8]) rotate([90,0,0]) cylinder(3,d=4,$fn=180,true);
        translate([0,0,8]) rotate([90,0,90]) triangle(3,7,7);
    }
    
    translate([15,20,3]) rotate(180) triangle(3,height,12);
    translate([12,20,3]) rotate([0,90,180]) triangle(3,height,12);

    translate([15+molex_width,0,0]) difference() {
        cube([15,3,15],false);
        translate([8,3,8]) rotate([90,0,0]) cylinder(3,d=4,$fn=180,true);
        translate([8,0,15]) rotate([180,0,90]) triangle(3,7,7);
    }
    translate([15+molex_width+3,20,3]) rotate(180) triangle(3,height,12);
    translate([13+molex_width+height,3,3]) rotate([0,90,90]) triangle(3,12,height);

    width = molex_full_width(pins_per_row);
    panel_hook_height = molex_panel_hook_height();
    difference() {
        translate([12,0,0]) cube([molex_width + 6,height + 3,3],false);
        
        translate([15+molex_width/2,height-1-(molex_height)/2,1.5]) rotate(90) cube([panel_hook_height, width, 3], true);
        translate([15+molex_width/2,height-1-(molex_height)/2,1.5]) rotate(90) minifit_panel_hole(pins_per_row, rows, 3);
    }
    difference() {
        translate([15+molex_width/2,height-1-(molex_height)/2,2]) rotate(90) cube([panel_hook_height, width, 2], true);
        width_with_hooks = molex_width_with_hooks(pins_per_row);
        translate([15+molex_width/2,height-1-(molex_height)/2,2]) rotate(90) cube([panel_hook_height, width_with_hooks, 2], true);
    }

    if(pins_per_row > 4) {
        triangle_width = (width-6)/2;
        translate([15+triangle_width,0,3]) rotate([0,0,90]) triangle(3,triangle_width,6);
        translate([15+width-triangle_width,3,3]) rotate([0,0,-90]) triangle(3,triangle_width,6);
    }
}

module MolexBottomMount(pins_per_row=5, rows=2, height_to_bottom = 0) {
    molex_width = molex_full_width(pins_per_row);
    molex_height = molex_full_height(rows);
    height = molex_height + 2.4 + 3;
    height_to_bottom = 14 + height_to_bottom - 3;

    module holder() { 
        difference() {
            cube([15,18,3],false);
            translate([5,9,0]) rotate([0,0,0]) cylinder(3,d=4,$fn=180,true);
        }
        translate([12,0,0]) cube([3,18,height_to_bottom], false);
        translate([12,0,height_to_bottom+3]) rotate([-90,0,90]) triangle(3,height_to_bottom,12);
        translate([12,15,height_to_bottom+3]) rotate([-90,0,90]) triangle(3,height_to_bottom,12);
        translate([0,0,3]) rotate([90,90,0]) triangle(3,12,12);
        translate([12,30,3]) rotate([180,90,0]) triangle(3,12,12);
        translate([12,-12,0]) cube([3,42,3],false);
        translate([12,-12,3]) rotate([0,0,0]) triangle(3,12,12);
        translate([15,30,3]) rotate([0,0,180]) triangle(3,12,12);
    }

    holder();
    translate([30 + molex_width,0,0]) mirror([10,0,0]) holder();

    panel_hook_height = molex_panel_hook_height();
    difference() {
        translate([12,0,height_to_bottom]) cube([molex_width + 6,height + 1,3],false);
        
        rotate(90) translate([height/2, -15-molex_width/2,height_to_bottom + 1.5]) cube([panel_hook_height, molex_width, 3], true);
        translate([15+molex_width/2,height/2,height_to_bottom + 1.5]) rotate(90) minifit_panel_hole(pins_per_row, rows, 3);
    }
    difference() {
        translate([15+molex_width/2,height/2,height_to_bottom + 1]) rotate(90) cube([panel_hook_height, molex_width, 2], true);
        width_with_hooks = molex_width_with_hooks(pins_per_row);
        translate([15+molex_width/2,height/2,height_to_bottom + 1]) rotate(90) cube([panel_hook_height, width_with_hooks, 2], true);
    }

    if(pins_per_row > 4) {
        triangle_width = (molex_width-6)/2;
        translate([15+triangle_width,3,height_to_bottom]) rotate([0,180,90]) triangle(3,triangle_width,6);
        translate([15+molex_width-triangle_width,0,height_to_bottom]) rotate([0,180,-90]) triangle(3,triangle_width,6);

        translate([15+triangle_width,height+1,height_to_bottom]) rotate([0,180,90]) triangle(3,triangle_width,6);
        translate([15+molex_width-triangle_width,height-2,height_to_bottom]) rotate([0,180,-90]) triangle(3,triangle_width,6);
    }
}

// MolexSideMount(pins_per_row=12, rows=2);
MolexBottomMount(pins_per_row=12, rows=2, height_to_bottom=15);