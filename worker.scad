

// Lib
include <variables.scad>;
use <head.scad>
use <head_backplate.scad>
use <neck.scad>
use <chest.scad>
use <chest_backplate.scad>
use <shoulder.scad>
use <base.scad>;
use <base_backplate.scad>;

// Module
module Worker() {

	// Head
	translate([-head_translation/2,0,0]){
		head();

		// Head Backplate
		translate([0,head_depth/2,0])
			head_backplate();
	}

	// Neck
	translate([0,0,-neck_depth/2-head_radius-neck_depth/2])
		neck();

	// Chest
	translate([0,0,-head_radius-neck_depth-chest_depth/2]){
		chest();

		// Chest Backplate
		translate([0,chest_height/2+chest_offset-chest_thickness/2,0])
			chest_backplate();

	}

	// Shoulder
	translate([-chest_width/2+chest_thickness+4.21-frame_depth/2,0,-head_radius-neck_depth-chest_depth+frame_depth+shaft_length+frame_width/2+chest_thickness])
		shoulder();

	// Base
	translate([0,0, -head_radius-head_thickness-spine_depth-chest_height/2]){
		base();
	
		// Base Backplate
		translate([0,0,-base_depth/2]) 
			base_backplate();
	}

}

// Call
Worker();