

// Lib
include <variables.scad>;

// Module
module base_backplate(){

	// Backplate
	difference(){		
		linear_extrude(base_thickness+overlap, center=centered) 
			offset(base_offset)
				square([base_width+overlap, base_height+overlap], centered);
		
		// Caster Wheel Divot Negative
		translate([-base_divot_width/2,-80,-base_thickness/2-overlap])
				cube([base_divot_width,base_divot_depth,base_divot_height]);

		// Base Chassis Backplate Lip Screw Negatives
		translate([-base_width/2-base_offset/3.5+115,base_height/2+base_offset/3.5+8,-base_thickness])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
		translate([base_width/2+base_offset/3.5,-base_height/2-base_offset/3.5,-base_thickness])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
		translate([-base_width/2-base_offset/3.5,-base_height/2-base_offset/3.5,-base_thickness])
			cylinder(h=base_thickness*2+overlap,d=nema23_screw_diameter);
	}

	// Caster Wheel Divot Positive
	translate([-base_divot_width/2,-80,-base_thickness/2-overlap])
		difference(){
			translate([-base_thickness,-base_thickness,base_thickness])
				cube([base_divot_width+base_thickness*2,base_divot_depth+base_thickness*2,base_divot_height]);
			
			// Hollow Negative
			cube([base_divot_width,base_divot_depth,base_divot_height]);

			// Screw Hole Negatives
			translate([caster_hole_from_width1,caster_hole_from_height,0])
				cylinder(h=base_thickness*4+overlap,d=nema23_screw_diameter);
			translate([caster_hole_from_width1,base_divot_depth-caster_hole_from_height,0])
				cylinder(h=base_thickness*4+overlap,d=nema23_screw_diameter);
			translate([-caster_hole_from_width2+base_divot_width,caster_hole_from_height,0])
				cylinder(h=base_thickness*4+overlap,d=nema23_screw_diameter);
			translate([base_divot_width-caster_hole_from_width2,base_divot_depth-caster_hole_from_height,0])
				cylinder(h=base_thickness*4+overlap,d=nema23_screw_diameter);
		}

	// Base Spine Mount Positive
	union(){
		translate([0,0.7*in,base_depth/2])
			difference(){
				translate([0,0,spine_base_depth/2-base_depth/2+base_thickness/2+spine_bottom_depth/2])
				cube([spine_base_width+spine_base_thickness,spine_base_height+spine_base_thickness,spine_base_depth+spine_bottom_depth], center=centered);

				// Spine Base Negative
				translate([0,0,spine_base_depth/2-base_depth/2+base_thickness/2+spine_bottom_depth+overlap])
				cube([spine_base_width,spine_base_height,spine_base_depth], center=centered);

				// Spine Base Bottom Negative
				translate([0,spine_bottom_height/2-spine_base_height/2+spine_bottom_translation,-base_depth/2+spine_bottom_depth/2+base_thickness/2+overlap*2])
				cube([spine_bottom_width,spine_bottom_height, spine_bottom_depth], center=centered);

				// Spine Base Cord Negative
				translate([spine_base_width/2-spine_cord_height/2+overlap+spine_base_thickness,spine_base_height/2-spine_cord_height/2+overlap+spine_base_thickness,-20])
				cube([spine_cord_width, spine_cord_height, spine_cord_depth], center=centered);			
			}
	}// Base Spine Mount Positive
	
}

// Call
base_backplate();



