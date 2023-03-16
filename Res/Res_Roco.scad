

module sidepanel() {
    sidepanel_length = 24;
    sidepanel_height = 6.1;
    sidepanel_depth = 1.2;
    sidepanel_bar_width = 1.2;
    sidepanel_bar_space = ((sidepanel_length - 1.2) - 1.2)/8;
    sidepanel_bar_height = sidepanel_height - 1.8 - 1.3;

    translate([0, 0, 0.9]) cube([sidepanel_length-1, sidepanel_depth, 1.8], true);
    translate([0, 0, sidepanel_height - 1.3/2]) cube([sidepanel_length, sidepanel_depth, 1.3], true);
    difference() {
        translate([0, -0.3, (sidepanel_height - 1.3)/2]) cube([sidepanel_length, sidepanel_depth/2, sidepanel_height - 1.3], true);
        translate([0, -0.5, 6.1/2 + 0.55]) cube([2, 0.2, 1], true);
        translate([0, -0.5, 6.1/2 - 0.55]) cube([2, 0.2, 1], true);
    }

    start = (sidepanel_length - 2.4)/2;
    for( pos = [0 : 8] ) {
        translate([-start + pos * sidepanel_bar_space, 0.25, sidepanel_bar_height/2 + 1.8]) cube([sidepanel_bar_width, 0.5, sidepanel_bar_height], true);
    }
}

module base() {

    cube([32, 214.5, 3.3], true);
}