
// Global
overlap = 0.01; 
centered = true;
$fn = 100;
in = 25.4;
cm = 10;
mm = 1;
thickness = 0.25 *in;

// Head
head_radius = 3 *in;
head_translation = 6 *in;
head_depth = 8 *in;
head_thickness = 0.25 *in;
head_height = head_radius * 2;
head_width = head_radius * 2 + head_translation;

// Chest
chest_width = 8.5 * in; 
chest_height = 6 *in; 
chest_offset = 1 *in;
chest_depth = 6.5 *in; 
chest_thickness = 0.25 *in;

// Base 
base_width = 8.5 *in;
base_height = 6 *in;
base_offset = 1 *in;
base_depth = 140 *mm;
base_top_width = 108 *mm;
base_top_height = 76 *mm;
base_top_depth = 55 *mm;
base_top_offset = 1 *in;
base_thickness = 0.25 *in;
base_divot_width = 70 *mm;
base_divot_height = 15 *mm;
base_divot_depth = 50 *mm;
caster_hole_diameter = 5*mm;
caster_hole_from_width1 = 3 *mm + caster_hole_diameter/2;
caster_hole_from_width2 = 2.5 *mm + caster_hole_diameter/2;
caster_hole_from_height = 8.5 *mm + caster_hole_diameter/2;

// Shoulder
shoulder_diameter = 2 *in;
shoulder_translation = 1.50 *in;
shoulder_height = 2 *in;
shoulder_thickness = thickness;
shoulder_mount_thickness = thickness;

// Rim
rim_thickness = 0.125 *in;
rim_depth = 0.75 *in;

// Camera
cam_radius = 0.25 *in;
cam_depth = 3 *in;
cam_height = head_radius/4;
cam_distance = head_translation;

// Plate
plate_width = head_translation-cam_radius*2;
plate_depth = head_depth/2; 
plate_height = head_radius-cam_height;
plate_thickness = head_thickness;

// Microphone
mic_radius = 3 *cm;
mic_height = 0.5 *in;

// Vents
vent_radius = 0.2 *in;
vent_depth = 1 *in;

// Neck
neck_width = 3 *cm;
neck_height = 3.5 *cm;
neck_depth = 5 *cm;
neck_offset = 10;
neck_thickness = thickness;

//Microcomputer
raspi_width = 85;
raspi_depth = 56;
raspi_height = 17;

// Spine
spine_width = 4 *cm;
spine_height = 4.5 *cm;
spine_depth = 19 *in;
spine_mount_thickness = 0.25 *cm;
spine_mount_hole = 6 *mm;
spine_mount_diameter = 2.1 *cm;
spine_mount_depth = 2.5 *cm;

// Base Spine Mount
spine_bottom_height = 0.75 *in;
spine_bottom_width = 0.75 *in;
spine_bottom_depth = 0.75 *in;
spine_bottom_translation = 0.4 *in;

spine_base_width = 1.6 *in;
spine_base_height = 3.1 *in; 
spine_base_depth = 4 *in;
spine_base_thickness = 0.25 *in*2;

spine_cord_width = 1 *in;
spine_cord_height = 1 *in;
spine_cord_depth =  1 *in;

// Speaker 
speaker_width = 4.33 *in;
speaker_depth = 4.13 *in;
speaker_height = 3.5 *in;

// Motor Driver
driver_height = 3.75 *in;
driver_width  = 1.1 *in;
driver_depth  = 2.75 *in; 

// Power Supply
psu_height = 8.5 *in;
psu_width = 4.5 *in;
psu_depth = 2 *in;
power_supply_width = 5 *in;
power_supply_depth = 2.5 *cm;
power_supply_height = base_thickness*2;

// Steppers 
frame_width = 57 *mm; 
frame_height = 57 *mm;
frame_depth = 56 *mm; 
emboss_height = 1.6 *mm;
emboss_diameter = 38.1 *mm;
shaft_length = 21.5 *mm;
shaft_divot_height = 15.25 *mm;
shaft_divot_width  = 0.4 *mm;
shaft_diameter = 6.35 *mm;
large_shaft_diameter = 0.6 *in;
arm_clamp_thickness = 0.25 *in;

// Screws
screw_type = "M3";
screw_distance = 0.06 *in;
m3_screw_thread_depth = 7;
m3_screw_thread_diameter = 3;
m3_screw_head_depth = 3.5;
m3_screw_head_diameter = 7;
nema23_screw_diameter = 5 *mm;
nema23_screw_distance = 47 *mm;

// Ender 3 Build Volume
ender_3_width = 220 *mm;
ender_3_height = 220 *mm;
ender_3_depth = 250 *mm;

// Wheels
wheel_diameter = 7 *in;
wheel_width = 1.5 *in;

// Shaft Mount
arm_clamp_width = 10 *mm;
arm_clamp_depth = shaft_diameter+thickness;
arm_clamp_height = shaft_diameter+thickness*2;

// Arm Integrated Lead Screw Stepper 
integrated_stepper_width = 42.3 *mm;
integrated_stepper_height = 42.3 *mm;
integrated_stepper_depth = 39.5 *mm;
integrated_emboss_height = 2 *mm;
integrated_emboss_diameter = 22 *mm;
integrated_port_height = 7 *mm;
integrated_port_width = 16 *mm;
integrated_port_depth = 9.6 *mm;
lead_screw_diameter = 10 *mm;
lead_screw_length = 200 *mm; 
lead_nut_diameter = 22 *mm;
lead_nut_height = 3.8 *mm;
nema17_screw_distance = 31 *mm;
nema17_screw_diameter = undef;

// Arm
arm_thickness = thickness;
arm_height = integrated_stepper_height + arm_thickness;
arm_depth =  lead_screw_length;
arm_width = integrated_stepper_width + arm_thickness;
arm_clamp_offset = 10;

// Stepper Module
module NEMA23(){	

	// Emboss
	translate([0,0,frame_depth/2+emboss_height/2])
	cylinder(h=emboss_height,d=emboss_diameter,center=centered);

	// Shaft
	difference(){
		translate([0,0,frame_depth/2+shaft_length/2])
			cylinder(h=shaft_length,d=shaft_diameter,center=centered);
		translate([-shaft_diameter/2+shaft_divot_width/2,0,-shaft_divot_height/2+frame_depth/2+shaft_length])
		cube([shaft_divot_width,shaft_diameter, shaft_divot_height+overlap],center=centered);
	}

	// Frame
	cube([frame_width,frame_height,frame_depth], center=centered);

	// Screws
	for(screw_distance=[-nema23_screw_distance/2:nema23_screw_distance/2:nema23_screw_distance/2]){
		translate([screw_distance,screw_distance,frame_depth/2])
		cylinder(h=emboss_height+thickness,d=nema23_screw_diameter);
		translate([-screw_distance,screw_distance,frame_depth/2])
		cylinder(h=emboss_height+thickness,d=nema23_screw_diameter);		
	}
}

// Integrated Stepper Module
module NEMA17(){	

	// Emboss
	translate([0,0,integrated_stepper_depth/2+integrated_emboss_height/2])
	cylinder(h=integrated_emboss_height,d=integrated_emboss_diameter,center=centered);

	// Lead Screw
	difference(){
		translate([0,0,integrated_stepper_depth/2+lead_screw_length/2])
			cylinder(h=lead_screw_length,d=lead_screw_diameter,center=centered);
	}

	// Frame
	cube([integrated_stepper_width,integrated_stepper_height,integrated_stepper_depth], center=centered);

	// Screws
	for(screw_distance=[-nema17_screw_distance/2:nema17_screw_distance/2:nema17_screw_distance/2]){
		translate([screw_distance,screw_distance,integrated_stepper_depth/2])
		cylinder(h=integrated_emboss_height+thickness,d=nema17_screw_diameter);
		translate([-screw_distance,screw_distance,integrated_stepper_depth/2])
		cylinder(h=integrated_emboss_height+thickness,d=nema17_screw_diameter);		
	}
} 

