

// Lib
include <variables.scad>;

// Module
module base(){

	// Base Chassis Positive
	difference(){
		hull(){			
			translate([0,0,base_depth/2+base_top_depth/2]) 
				linear_extrude(base_top_depth, center=centered) 
					offset(base_top_offset)
						square([base_top_width, base_top_height], centered);	
			//translate([0,0,base_translation]) 
			linear_extrude(base_depth, center=centered) 
				offset(base_offset)
					square([base_width, base_height], centered);
		}

		//Base Chassis Hollow Negative
		hull(){			
			translate([0,0,base_depth/2+base_top_depth/2]) 
				linear_extrude(base_top_depth-base_thickness*2, center=centered) 
					offset(base_top_offset)
						square([base_top_width-base_thickness, base_top_height-base_thickness], centered);								
			//translate([0,0,base_translation]) 
				linear_extrude(base_depth-base_thickness, center=centered) 
					offset(base_offset)
						square([base_width-base_thickness*2, base_height-base_thickness*2], centered);
		}

		// Base Chassis Backplate Negative
		translate([0,0,-base_depth/2]) 
			linear_extrude(base_thickness+overlap, center=centered) 
				offset(base_offset)
					square([base_width+overlap, base_height+overlap], centered);

		// Base Chassis Spine Negative
		cube([spine_width, spine_height, spine_depth], center=centered);

		// Base Wheel Motor Negatives
		for(mirrored=[0:1]){
			mirror([mirrored,0,0])				
				translate([-frame_depth/2-emboss_height+base_width/2+base_offset-6, base_height/2-base_offset,-base_depth/2+base_thickness*6])
					rotate([0,90,0])
						NEMA23();		
		}

		// Base Wheel Larger Shaft Negatives
		translate([0,20,0])
		union(){
			for(mirrored=[0:1]){
				mirror([mirrored,0,0])				
					translate([-frame_depth/2-emboss_height+base_width/2+base_offset-base_thickness/2, base_height/2-base_offset,-base_depth/2+base_thickness*6])
						rotate([0,90,0])
							// Shaft
							difference(){
								translate([0,0,frame_depth/2+shaft_length/2])
									cylinder(h=shaft_length*2,d=large_shaft_diameter,center=centered);
								translate([-large_shaft_diameter/2+shaft_divot_width/2,0,-shaft_divot_height/2+frame_depth/2+shaft_length])
								cube([shaft_divot_width,large_shaft_diameter, shaft_divot_height+overlap],center=centered);
							}
			}
		}

		// Base Power Supply Charging Negative
		*translate([0,base_width/2-base_thickness,-base_depth/2+power_supply_height+base_thickness+3])
			cube([power_supply_width,power_supply_height,power_supply_depth],center=centered);

	} // Base Chassis Positive  

	// Base Chassis Backplate Lip Positive
	difference(){			
		translate([0,0,-base_depth/2+base_thickness])
			linear_extrude(base_thickness+overlap, center=centered) 
				offset(base_offset)
					square([base_width+overlap-base_thickness, base_height+overlap-base_thickness], centered);			
		// Base Chassis Backplate Lip Hollow Negative
		translate([0,0,-base_depth/2+base_thickness])
			linear_extrude(base_thickness+overlap*2, center=centered) 
				offset(base_offset)
					square([base_width+overlap-base_thickness*5, base_height+overlap-base_thickness*5], centered);	

		// Base Chassis Backplate Lip Screw Negatives
		translate([-base_width/2-base_offset/3.5+115,base_height/2+base_offset/3.5+8,-base_depth/2-base_thickness/4])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
		translate([base_width/2+base_offset/3.5,-base_height/2-base_offset/3.5,-base_depth/2-base_thickness/4])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
		translate([-base_width/2-base_offset/3.5,-base_height/2-base_offset/3.5,-base_depth/2-base_thickness/4])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
			
	} // Base Chassis Backplate Lip Positive

}

// Call
base();



