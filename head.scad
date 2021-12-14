

// Lib
include <variables.scad>;

// Module
module head(){

	// Head Chassis Positive
	difference(){
		rotate([90,0,0])
			linear_extrude(head_depth, center=centered)
				hull(){				
					circle(head_radius);
					translate([head_translation,0,0])
						circle(head_radius);
				}

		// Head Chassis Hollow Negative
		rotate([90,0,0])
			linear_extrude(head_depth-head_thickness, center=centered)
				hull(){				
					circle(head_radius-head_thickness);
					translate([head_translation,0,0])
						circle(head_radius-head_thickness);
				}

		// Head Camera Negatives
		for(camera_distance=[0:cam_distance:cam_distance]){
			translate([camera_distance,0,0])
				hull()
					for(camera_height = [-cam_height:cam_height*2:cam_height]){
						translate([0,-head_depth/2,camera_height])
							rotate([90,0,0])
								linear_extrude(cam_depth, center=centered)
									circle(cam_radius);
					}
		}

		// Head Microphone Negatives
		union(){
			translate([head_translation-head_thickness+mic_radius*2,0,0])
				sphere(mic_radius);
			translate([head_thickness-mic_radius*2,0,0])
				sphere(mic_radius);
		}

		// Head Neck Negative
		translate([head_translation/2,0,-head_radius])
				cylinder(h=neck_depth+neck_thickness, d=neck_height, center=centered);

		// Head Backplate Negative
		translate([0,head_depth/2,0])
			rotate([90,0,0])
				hull(){
					cylinder(h=head_thickness+overlap, r=head_radius+overlap, center=centered);
					translate([head_translation,0,0])
						cylinder(h=head_thickness+overlap, r=head_radius+overlap, center=centered); 
				}
	}

	// Head Backplate Mounts
	translate([head_radius,head_depth/2-head_thickness,0]){	
		difference(){	
			cube([head_radius*2, head_thickness, head_radius*2],center=centered);
			cube([head_radius*2-head_thickness*4, head_thickness+overlap, head_radius*2],center=centered);
			cube([head_radius*2+overlap, head_thickness+overlap, head_radius*2-head_thickness*5],center=centered);

			// Head Backplate Screw Negatives
			for(mirrored=[0:1]){
				mirror([mirrored,0,0]){
					translate([head_radius-head_thickness,head_thickness,head_radius-head_thickness*1.5])
						rotate([90,0,0])
							cylinder(h=head_thickness*2, d=nema23_screw_diameter);
					translate([head_radius-head_thickness,head_thickness,-head_radius+head_thickness*1.5])
						rotate([90,0,0])
							cylinder(h=head_thickness*2, d=nema23_screw_diameter);
				}
			}
		}
	}		

	// Head Rim Positive			
	translate([0,-head_depth/2-rim_depth/2,0])
		rotate([90,0,0])
			difference(){
				hull(){	
					cylinder(h=rim_depth, r=head_radius, center=centered);
					translate([head_translation,0,0])
						cylinder(h=rim_depth, r=head_radius, center=centered);
				}		
				hull(){	
					cylinder(h=rim_depth+overlap, r=head_radius-rim_thickness, center=centered);
					translate([head_translation,0,0])
						cylinder(h=rim_depth+overlap, r=head_radius-rim_thickness, center=centered);
				}			
			}

}

// Call
head();



