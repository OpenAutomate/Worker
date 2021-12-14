

// Lib
include <variables.scad>;

// Module
module neck(){

	// Neck Positive
	difference(){
		linear_extrude(neck_depth)
			offset(neck_offset)
				square([neck_width, neck_height], center=centered);

		// Neck Hollow Negative
		translate([0,0,-neck_thickness/2])
			linear_extrude(neck_depth+neck_thickness)
				offset(neck_offset)
					square([neck_width-neck_thickness, neck_height-neck_thickness], center=centered);
	}
}

// Call
neck();