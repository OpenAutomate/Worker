

// Lib
include <variables.scad>;

// Module
module chest_backplate(){

	// Chest Backplate Positive
	difference(){
		cube([chest_width+chest_thickness,chest_thickness, chest_depth+overlap],center=centered);

		// Chest Backplate Screw Negatives
		for(mirrored=[0:1]){
			mirror([mirrored,0,0]){
				translate([chest_width/2-chest_thickness/2,chest_thickness,chest_height/2-chest_thickness])
					rotate([90,0,0])
						cylinder(h=chest_thickness*2, d=nema23_screw_diameter);
				translate([chest_width/2-chest_thickness/2,chest_thickness,-chest_height/2+chest_thickness])
					rotate([90,0,0])
						cylinder(h=chest_thickness*2, d=nema23_screw_diameter);
			}
		}
	}
}

// Call
chest_backplate();
