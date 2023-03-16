include <BOSL2/constants.scad>
include <BOSL2/std.scad>

module haken_einzel() {
    haken_height = 3.1 - 0.8 - 0.7;
    translate([29.5/2 - 0.55, 0, -haken_height/2 + 0.3]) cube( [ 1.1, 1.2, haken_height], true );
    translate([29.5/2 - 0.375 + 0.40, 0, -haken_height + 0.3 - 0.35 ]) cuboid([0.75, 1.2, 0.7], rounding=0.7, edges=[BOTTOM + RIGHT], $fn=180);
    translate([29.5/2 - 0.375 - 0.35, 0, -haken_height + 0.3 - 0.35 ]) cuboid([0.75, 1.2, 0.7], rounding=0.2, edges=[BOTTOM + LEFT], $fn=180);
}

module haken_eine_seite() {
    haken_single();
    translate([0, 27 + 1.2, 0]) haken_single();
    translate([0, 27 + 1.2*2 + 20.8, 0]) haken_single();
    translate([0, 27 + 1.2*3 + 20.8 + 23.7, 0]) haken_single();
    translate([0, 27 + 1.2*4 + 20.8 + 23.7 + 4.4, 0]) haken_single();
    translate([0, 27 + 1.2*5 + 20.8 + 23.7 + 4.4 + 22, 0]) haken_single();

    translate([0, -27 - 1.2, 0]) haken_single();
    translate([0, -27 - 1.2*2 - 20.8, 0]) haken_single();
    translate([0, -27 - 1.2*3 - 20.8 - 23.7, 0]) haken_single();
    translate([0, -27 - 1.2*4 - 20.8 - 23.7 - 4.4, 0]) haken_single();
    translate([0, -27 - 1.2*5 - 20.8 - 23.7 - 4.4 - 22, 0]) haken_single();
}

module boden_ausschnitt_eine_seite( floor_length ) {
    start_2 = floor_length/2 - 17.5 - 2.2/2;// - 5.05;

    translate([ (29.5 - 2)/2, -start_2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, -start_2 + 21.9 + 2.2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, -start_2 + 21.9*2 + 2.2*2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, -start_2 + 21.9*2 + 2.2*3 + 22, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, start_2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, start_2 - 21.9 - 2.2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, start_2 - 21.9*2 - 2.2*2, 0.2 ]) cube([ 2, 2.2, 1], true);
    translate([ (29.5 - 2)/2, start_2 - 21.9*2 - 2.2*3 - 22, 0.2 ]) cube([ 2, 2.2, 1], true);
}

module holzboden() {

    floor_length = 151.3 + 30.3*2;
    slab_width = 1.5;
    slab_space = 0.1;
    slab_count = floor_length / ( slab_width + slab_space );

    difference() {
        union() {
            translate([0,0,0.4 + 0.3]) cube([29.5, floor_length, 0.8], true);
            translate([0,0,0.55]) cube([29.5, 151.4, 1.1], true);
        }
        start = floor_length/2 - slab_width + 0.35;
        for( pos = [ 0 : slab_count ] ) {
            translate([0, -start + pos * ( slab_width + slab_space ), 1.05]) cube([29.5, slab_space, 0.1], true);
        }
        boden_ausschnitt_eine_seite(floor_length);
        mirror([1,0,0]) boden_ausschnitt_eine_seite(floor_length);

        
    }
    haken_eine_seite();
    mirror([1,0,0]) haken_eine_seite();
}