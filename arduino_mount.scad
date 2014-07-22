// copied from Thingiverse 
// http://www.thingiverse.com/thing:14742

// Arduino (RAMPS) mount for Prusa / Mendel with accessories holes by MakerCubed is 
// licensed under the Creative Commons - Attribution - Share Alike license.

holes_size = 1.75; // Radius
holes_size_outter = 3.75; // Radius
holes_support = 11;


translate([70.5,0,0]) {
	translate([0,-30,0]) {
		bar_clamp();
		cube([10,76,1.3]);
	}
	translate([6.8,-18,0])rotate([0,0,3.5])cube([3,63,holes_support*.65]);
}

translate([-3,0,0]) {
	translate([0,-30,0]) {
		bar_clamp();
		cube([10,76,1.3]);
	}
	translate([6.8,-18,0])rotate([0,0,3.5])cube([3,63,holes_support*.65]);
}


difference() {
	translate([5,-17,0])cube([66,2,20]);
	for (z = [0:8]) {
		translate([(z*7)+10,-14,15])rotate([90,0,0])cylinder(r=1.5,h=5, $fn=10);
	}
}

arduino_holes();


$fn=100;
linear_extrude(height=1.3)barbell([75,48],[0,0],6,6,230,230);
linear_extrude(height=1.3)barbell([81.5,0],[1,48],6,6,240,240);



// Test

module arduino_holes() {
difference() {

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
// Holes
//RB
	cylinder(r=holes_size,h=holes_support, $fn=20);
//LB
	translate([1,48,0])cylinder(r=holes_size,h=holes_support, $fn=20);
//RT
	translate([81.5,0,0])cylinder(r=holes_size,h=holes_support, $fn=20);
//LT
	translate([75,48,0])cylinder(r=holes_size,h=holes_support, $fn=20);
}

}

module bar_clamp() {

	translate([0,7,7])rotate([0,90,0])difference() {
	translate([-3,0,5])cube([20,16,10], true);

	union() {
		cylinder(10, r=4, $fn=40);
		translate([-7,0,5])cube([13,7,10], center=true);
	}
	// Hole
		#translate([-8,8,5])rotate([90,0,0])cylinder(16, r=1.5, $fn=20);
	}
}


module barbell (x1,x2,r1,r2,r3,r4) 
{
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	render()
	difference ()
	{
		union()
		{
			translate(x1)
			circle (r=r1);
			translate(x2)
			circle(r=r2);
			polygon (points=[x1,x3,x2,x4]);
		}
		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}
