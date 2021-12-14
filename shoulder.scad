

// Lib
include <variables.scad>;

// Module
module shoulder(){

	// Shoulder Chassis Positive
	difference(){
		translate([-4.45,0,0]){	
			rotate([0,-90,0]){
				translate([0,0,-frame_depth/2])
					cube([frame_width+shoulder_mount_thickness, frame_height+shoulder_mount_thickness, frame_depth+shoulder_mount_thickness], center=centered);
			}
		}

		// Shoulder Hollow Negative
		rotate([0,-90,0]){
			translate([0,0,-frame_depth/2])
				NEMA23();					
			translate([0,0,-frame_depth/2+1])
				NEMA23();											
		}

		// Shoulder Wiring Negative
		rotate([0,-90,0]){
			translate([0,0,-frame_depth])
				union(){
					NEMA23();
					cube([frame_width*2,frame_height/3,frame_depth/2],center=centered);
					cube([frame_width/3,frame_height*2,frame_depth/2],center=centered);
				}
		}
		
	}

	// Shaft Mount Positive
	difference(){
		translate([frame_depth/2,0,-frame_depth/2-shaft_length/2+shoulder_mount_thickness/2-2-1])
			cube([shaft_diameter+shoulder_mount_thickness, shaft_diameter+shoulder_mount_thickness, shaft_length/2+6], center=centered);

		// Shaft Negative 
		translate([frame_depth/2,0,-frame_depth/2-shaft_length/2-3-shoulder_mount_thickness])
			cylinder(h=shaft_length+1, d=shaft_diameter, center=centered);
	}
}
		
// Call
shoulder();

