
// Based on source openSCAD file from
// http://www.thingiverse.com/thing:14742
//
// Arduino (RAMPS) mount for Prusa / Mendel with accessories holes by 
// MakerCubed is licensed under the 
// Creative Commons - Attribution - Share Alike license.


holes_size = 1.75; // Radius
holes_size_outter = 3.75; // Radius
holes_support = 11;

 
difference(){

	union(){

		// fan mount
		translate([-15,-20,0])
			cube([106, 5, 10]);

		translate([70.5,0,0]) {
			union(){
				translate([0,-20,0]) {
					cube([10,66,1.3]);
				}
				translate([6.8, -18, 0.1])
					rotate([0,0,3.5])
						cube([3,63,holes_support*.75]);
			}
		}
		
		translate([-3,0,0]) {
			translate([0,-20,0]) {
				cube([10,66,1.3]);
			}
			translate([6.8, -18, 0.1])
				rotate([0,0,3.5])
					cube([3,63,holes_support*.75]);
		}
			
		translate([0,0,1.3]) 
			arduino_posts();
		
		linear_extrude(height=1.3)barbell([75,48],[0,0],6,6,230,230);
		linear_extrude(height=1.3)barbell([81.5,0],[1,48],6,6,240,240);
	
	}

	union(){
	
		translate([0,0,1.3]) 
			arduino_holes();
	
	
		translate([-10,-10,5])
			rotate([90,0,0])
				rotate([0,0,30])
					cylinder(r=2.5,h=15, $fn=6);

		translate([67.5,-10,5])
			rotate([90,0,0])
				rotate([0,0,30])
					cylinder(r=2.5,h=15, $fn=6);

	}		

}

// Test

module arduino_holes() {

		// Holes
		//RB
		translate([0,0,0])
			cylinder(r=holes_size,h=holes_support + 0.2, $fn=20);
		//LB
			translate([1,48,0])cylinder(r=holes_size,h=holes_support + 0.2, $fn=20);
		//RT
			translate([81.5,0,0])cylinder(r=holes_size,h=holes_support + 0.2, $fn=20);
		//LT
			translate([75,48,0])cylinder(r=holes_size,h=holes_support + 0.2, $fn=20);

}

module arduino_posts() {

		union() {
			// Outter
			//RB
				cylinder(r=holes_size_outter,h=holes_support, $fn=20);
			//LB
				translate([1,48,0])cylinder(r=holes_size_outter,h=holes_support, $fn=20);
			//RT
				translate([81.5,0,0])cylinder(r=holes_size_outter,h=holes_support, $fn=20);
			//LT
				translate([75,48,0])cylinder(r=holes_size_outter,h=holes_support, $fn=20);
		}

}

//module bar_clamp() {
//
//	translate([0,7,7])rotate([0,90,0])difference() {
//	translate([-3,0,5])cube([20,16,10], true);
//
//	union() {
//		cylinder(10, r=4, $fn=40);
//		translate([-7,0,5])cube([13,7,10], center=true);
//	}
//	// Hole
//		#translate([-8,8,5])rotate([90,0,0])cylinder(16, r=1.5, $fn=20);
//	}
//}


module barbell (x1,x2,r1,r2,r3,r4) 
{
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	//render()
	difference ()
	{
		union()
		{
			translate(x1)
			circle (r=r1, $fn=100);
			translate(x2)
			circle(r=r2	, $fn=100);
			polygon (points=[x1,x3,x2,x4]);
		}
		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}

function triangulate (point1, point2, length1, length2) = 
point1 + 
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b)); 

function rotated(a)=[cos(a),sin(a),0];
