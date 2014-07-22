module rounded_v_edges_cube(size=[20,20,20], r=4){
	linear_extrude(height=size[2]){		
		hull(){
			for(x_sign = [-1, 1]){
				for(y_sign = [-1, 1]){
		 			translate([
						x_sign * size[0] / 2 - x_sign * r, 
						y_sign * size[1] / 2 - y_sign * r,
						0 ])
							circle(r=r, $fn=30);
				}
			}
		}	
	}
}

module bracket()
{

	xtra_spc = 1.6;

		difference() {
			union() {
				
				translate([0, 35/2, 0])				
					rounded_v_edges_cube([50, 35, 100]);
				//translate([-25, 0, 0])				
					//cube([50, 35, 100]);

			//	translate([0, 0, 100])				
				//	%cylinder(r=20, h=50, $fn=30); 
			}
		   union() {
				
				translate([-20-xtra_spc, 10-xtra_spc, 5])
					cube([40+xtra_spc*2, 20+xtra_spc*2, 90]);
				translate([-40, 5, 12])
					cube([80, 40, 55]);
				translate([-40, 5, 90])
					cube([80, 40, 55]);
				translate([0, 8, 25]){				
					rotate([90,0,0]){
						cylinder(r=2, h=10, $fn=30); //6 gauge screw = 3.6 clearence hole
					}
				}
				translate([15, 8, 95]){				
					rotate([90,0,0]){
						cylinder(r=2, h=10, $fn=30); //6 gauge screw = 3.6 clearence hole
					}
				}

			}
		}
}


bracket();

//translate([0, -30, 0])
//	rounded_v_edges_cube();