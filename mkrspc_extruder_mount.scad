
width = 25;
length = 72;
height = 8;

module adjustable_bolt_slot(){
	// suits M4 bolts (M4x50 for the makerspace .5mm extruder)
	slot_length = 7;
	slot_width = 7;

	translate([0,0,3.9]){
		linear_extrude(height=height){
			hull(){
				translate([0, -slot_length/2.0, 0])
					circle(r=slot_width/2, $fn=20);
				translate([0, slot_length/2.0, 0])
					circle(r=slot_width/2, $fn=20);			
			}
		}
	}

	linear_extrude(height=4){
		hull(){
			translate([0, -slot_length/2.0 + 1, 0])
				circle(r=2.1, $fn=20);
			translate([0, slot_length/2.0 - 1, 0])
				circle(r=2.1, $fn=20);			
		}
	}

}

module extruder_mount(){
	difference(){
		linear_extrude(height=height){
			hull(){
				translate([0, -length/2.0 + width/2, 0])
					circle(r=width/2);
				translate([0, length/2.0 - width/2, 0])
					circle(r=width/2);			
			}
		}
		// spacing between extruder mount bolts is 50mm
		translate([0, -25, -0.1])
			adjustable_bolt_slot();
		translate([0, 25, -0.1])
			adjustable_bolt_slot();

		// spacing between hot-end bolts is 30mm
		translate([0, 15, -0.1])
			cylinder(r=1.55, h=height+0.2, $fn=30);
		translate([0, -15, -0.1])
			cylinder(r=1.55, h=height+0.2, $fn=30);

		// space for M3 bolt head on top (part is upside down in scad)
		translate([0, 15, -0.1])
			cylinder(r=3.2, h=3, $fn=30);
		translate([0, -15, -0.1])
			cylinder(r=3.2, h=3, $fn=30);

		// hole for the hot-end PTFE cylinder (15mm dia.)
		translate([0, 0, 4])
			cylinder(r=7.6, h=5.1, $fn=60);

		// hole for 3mm filament
		translate([0, 0, -0.1])
			cylinder(r=1.6, h=height+0.2, $fn=30);

	}
}


extruder_mount();

//translate([50,0,0])
//	adjustable_bolt_slot();

