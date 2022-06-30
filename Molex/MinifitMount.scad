//import("MinifitMount.stl", convexity=3);
// import("pwm_fan_controller.stl");

// translate([88,17.4,5.2]) cube([2,10.2,6],false);
// translate([88,19.6,2.8]) cube([2,5.75,10.8],false);
// translate([88,27.6,6.15]) cube([2,1.45,4.1],false);

module select_panel_hole(pins="10", depth=2) {
    if(pins == "2") { 
        panel_hole(width=5.8,height=10,depth=depth);
    } else if(pins == "4") {
        panel_hole(width=10,height=10,depth=depth);
    } else if(pins == "6") {
        panel_hole(width=14.2,height=10,depth=depth);
    } else if(pins == "8") {
        panel_hole(width=18.4,height=10,depth=depth);
    } else if(pins == "10") {
        panel_hole(width=22.6,height=10,depth=depth);
    } else if(pins == "12") {
        panel_hole(width=26.8,height=10,depth=depth);
    } else if(pins == "14") {
        panel_hole(width=31.1,height=10,depth=depth);
    } else if(pins == "16") {
        panel_hole(width=35.3,height=10,depth=depth);
    } else if(pins == "18") {
        panel_hole(width=39.5,height=10,depth=depth);
    } else if(pins == "20") {
        panel_hole(width=43.7,height=10,depth=depth);
    } else if(pins == "22") {
        panel_hole(width=47.9,height=10,depth=depth);
    } else if(pins == "24") {
        panel_hole(width=52.1,height=10,depth=depth);
    } 
}

module panel_hole(width=10,height=10, depth=2) {
    panel_hook_width = width + 5;
    panel_hook_height = 5.6;

    hook_width = 4;
    hook_height = height + 1.6;

    translate([-(height/2),-(width/2),-(depth/2)]) cube([height,width,depth],false);
    translate([-(panel_hook_height/2),-(panel_hook_width/2),-(depth/2)]) cube([panel_hook_height,panel_hook_width,depth],false);
    translate([-(height/2),-(hook_width/2),-(depth/2)]) cube([hook_height,hook_width,depth],false);
}

difference() {
    cube([20,60,2],true);
    select_panel_hole(pins="2");
}