

// Lib
include <variables.scad>;

// Module
module chest(){

	// Chest Chassis Positive
	difference(){

		// Chest Chassis Positive
		hull(){
			for(cylinder_x =[-chest_width/2:chest_width:chest_width/2],
					cylinder2_x=[-chest_offset*2:chest_offset*4:chest_offset*2],
					cylinder_y =[-chest_offset:chest_offset+chest_height/2:chest_height/2]){
				translate([cylinder_x,cylinder_y,0])
					cylinder(h=chest_depth, d=chest_offset*2, center=centered);
				translate([cylinder2_x,-chest_height/2,0])
					cylinder(h=chest_depth, d=chest_offset*2, center=centered);
			}
		}

		// Chest Chassis Hollow Negative
		hull(){
			for(cylinder_x =[-chest_width/2:chest_width:chest_width/2],
					cylinder2_x=[-chest_offset*2:chest_offset*4:chest_offset*2],
					cylinder_y =[-chest_offset:chest_offset+chest_height/2:chest_height/2]){
				translate([cylinder_x,cylinder_y,0])
					cylinder(h=chest_depth-chest_thickness*2, d=chest_offset*2-chest_thickness*2, center=centered);
				translate([cylinder2_x,-chest_height/2,0])
					cylinder(h=chest_depth-chest_thickness*2, d=chest_offset*2-chest_thickness*2, center=centered);
			}
		}
		
		// Chest Chassis Left-Right ROM Negatives
		for(mirrored=[0:1]){
			mirror([mirrored,0,0]){
				translate([-chest_width/2-frame_depth/2+chest_thickness,0,-chest_depth/2+frame_depth+shaft_length+frame_width/2+chest_thickness])
					rotate([0,90,0])			
						linear_extrude(frame_depth+shaft_length, center=centered)
							offset(arm_clamp_thickness)
								square([frame_width+arm_clamp_thickness*2,frame_height*2],center=centered);
			}
		}

		// Chest Chassis Backplate Negative
		translate([0,chest_height/2+chest_offset-chest_thickness/2,+chest_thickness])
			cube([chest_width+chest_thickness,chest_thickness+overlap, chest_depth+overlap],center=centered);

		// Chest Chassis Spine Negative
		cube([spine_width, spine_height, spine_depth], center=centered);

		// Chest Chassis Speaker Negative
		translate([0,-chest_depth/2,0]){
			rotate([90,0,0])
				cylinder(h=speaker_depth, d=speaker_height/2, center=centered);
		}
	} // Chest Chassis Positive

	// Chest Left/Right Stepper Mount Positive
	for(mirrored=[0:1]){
		mirror([mirrored,0,0])
			translate([-chest_width/2+chest_thickness+chest_thickness/2,0,-chest_depth/2+frame_depth+chest_thickness+chest_thickness/2])	
				difference(){
					cube([frame_width,frame_height,chest_thickness],center=centered);

					// Stepper Emboss Negative 
					hull()
						for(emboss_y = [0:frame_height/2:frame_height/2]){	
							translate([0,emboss_y,-frame_depth/2-chest_thickness/2-overlap])							
								translate([0,0,frame_depth/2+emboss_height/2])
									cylinder(h=emboss_height,d=emboss_diameter,center=centered);
						}

					// Stepper Shaft Negative 
					hull()
						for(emboss_y = [0:frame_height/2:frame_height/2]){	
							translate([0,emboss_y,-frame_depth/2-chest_thickness/2-overlap])
								difference(){
									translate([0,0,frame_depth/2+shaft_length/2])
										cylinder(h=shaft_length,d=shaft_diameter,center=centered);
									translate([-shaft_diameter/2+shaft_divot_width/2,0,-shaft_divot_height/2+frame_depth/2+shaft_length])
									cube([shaft_divot_width,shaft_diameter, shaft_divot_height+overlap],center=centered);
								}
						}

					// Screwhole Negatives
					translate([0,0,-frame_depth/2-chest_thickness/2-overlap])
						for(screw_distance=[-nema23_screw_distance/2:nema23_screw_distance/2:nema23_screw_distance/2]){
							translate([screw_distance,screw_distance,frame_depth/2])
							cylinder(h=emboss_height+thickness,d=nema23_screw_diameter);
							translate([-screw_distance,screw_distance,frame_depth/2])
							cylinder(h=emboss_height+thickness,d=nema23_screw_diameter);		
						}
				} 
	} 

	// Chest Backplate Lip Positive
	translate([0,chest_height/2+chest_offset-chest_thickness-chest_thickness/2,0]){	
		difference(){
			cube([chest_width+chest_thickness,chest_thickness, chest_depth+overlap],center=centered);
			cube([chest_width-chest_thickness*3,chest_thickness+overlap, chest_depth+overlap],center=centered);
			cube([chest_width+chest_thickness*3,chest_thickness+overlap, chest_depth-chest_thickness*7+overlap],center=centered);

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

	// Chest Spine Mount Positive
	translate([0,0,76]){ 

		// Spine Mount Support Positive
		translate([0,0,-chest_depth/2+thickness])
			difference(){
				cube([spine_width+thickness*2, spine_mount_depth, chest_depth-thickness*2+overlap], center=centered);
				
				// Wall Hollow Gap Negative
				cube([spine_width, spine_height*2, chest_depth+overlap], center=centered);
				
				// Linear Actuator Hole Negative				
				translate([0,0,17])
				for(drag_z = [0:-0.5:-4]){
					translate([0,0,drag_z])
						rotate([0,90,0])
							cylinder(h=spine_width+spine_mount_thickness*6, d=spine_mount_hole, center=centered);
				}
			}

		// Spine Mount Hub Positive
		translate([0,0,-chest_depth+frame_depth+shaft_length+frame_height/2])
			difference(){ 
				cube([ spine_width+spine_mount_thickness,spine_mount_diameter+spine_mount_thickness, spine_mount_diameter+spine_mount_thickness], center=centered);
				
				// Linear Actuator Inner Cylinder Negative
				translate([0,0,-4.5]) // Weird Linear Actuator Hole Location 
					cylinder(h=spine_mount_depth, d=spine_mount_diameter, center=centered);
				
				// Linear Actuator Wall Through Hole
				for(drag_z = [0:-0.5:-4]){
					translate([0,0,drag_z])				
						rotate([0,90,0])
							cylinder(h=spine_width+spine_mount_thickness*6, d=spine_mount_hole, center=centered);
				}
			}
	} 
	
}

// Call
chest();



