

module bracket()
{
		difference() {
			union() {
				
				translate([-25, 0, 0])
					cube([50, 35, 100]);

			//	translate([0, 0, 100])				
				//	%cylinder(r=20, h=50, $fn=30); 
			}
		   union() {
				
				translate([-20, 10, 5])
					cube([40, 20, 90]);
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

