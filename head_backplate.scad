


// Lib
include <variables.scad>;

// Module
module head_backplate(){

	// Head Backplate Positive
	difference(){
		rotate([90,0,0])
			hull(){
				cylinder(h=head_thickness+overlap, r=head_radius+overlap, center=centered);
				translate([head_translation,0,0])
					cylinder(h=head_thickness+overlap, r=head_radius+overlap, center=centered); 
			}

		// Head Backplate Screw Negatives
		translate([head_radius,0,0])
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

		// Head Backplate Vents Negatives
		*translate([-head_radius/2+vent_radius,vent_depth/2,-head_radius/2+vent_radius])
			for(vent_x = [0:vent_radius*3:head_translation+head_radius],
					vent_z = [0:vent_radius*3:head_radius]) 
				translate([vent_x,0,vent_z])
					rotate([90,0,0])
						cylinder(vent_depth,r=vent_radius);
	}

}

// Call
head_backplate();			