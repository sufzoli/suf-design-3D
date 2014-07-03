
// rotor
module circular_round(cr, ct, r, pad)
{
	difference()
	{
		rotate_extrude(convexity=10, $fn = 100)
			translate([cr-ct-r+pad,ct-pad,0])
				square(r+pad,r+pad);
		rotate_extrude(convexity=10, $fn = 100)
			translate([cr-ct-r,ct+r,0])
				circle(r=r,$fn=100);
	}
}

BladeThickness = 3;
NumberOfBlades = 12;
LayerHight = 0.1;
Width = 16.2;
BladeAngle = 45;
BladeLength = 27;

NumLayers = Width/LayerHight;

translate([0,0,10])
{
difference()
{
	cylinder(h=19.7,r=28, $fn=100);
	translate([0,0,16])
		cylinder(h=5,r=23, $fn=100);
	translate([0,0,-0.1])
		cylinder(h=16.3,r1=26, r2=23, $fn=100);
	translate([0,0,19.71])
		rotate(a=[180,0,0])
			circular_round(28.01, 0, 3, 0);
}
difference()
{
	union()
	{
		linear_extrude(height=Width, twist = -1 * BladeAngle, slices = Width / LayerHight, convexity=10)
			for(i=[0:NumberOfBlades-1])
				rotate(i*360/NumberOfBlades)
					translate([0,-0.5 * BladeThickness])
						square([BladeLength,BladeThickness]);
		cylinder(h=16.2,r=7.5, $fn=100);
	}
	translate([0,0,-0.1])
		cylinder(h=16.6,r=4, $fn=100);
}
difference()
{
	cylinder(h=2,r=35, $fn=100);
	translate([0,0,-0.1])
		cylinder(h=2.2,r=28, $fn=100);
	for(j=[0:59])
		rotate([0,0,6*j])
			translate([0,32.5,-0.1])
				cylinder(h=2.2,r=1, $fn=25);
}
}

// Opto Holder
translate([0,0,-7])
{
difference()
{
	union()
	{
		cylinder(h=7,r=30,$fn=100);
		// Cable space
		translate([-36,-10,0])
			cube([10,20,7]);
		// PCB Holder
		translate([-10,-40,0])
			cube([20,12,7]);
		// 
		translate([26,-6,0])
			cube([15,12,7]);
	}
	translate([0,0,-0.5])
		cylinder(h=8,r=26,$fn=100);
	translate([-30,-5,-0.5])
			cube([10,10,8]);
	translate([20,-2,-0.5])
			cube([25,4,8.5]);
	translate([35,-8,3.5])
		rotate([-90,0,0])
			cylinder(h=16,r=1.5,$fn=100);
	translate([6,-40.5,3.5])
		rotate([-90,0,0])
			cylinder(h=8,r=1,$fn=100);
	translate([-6,-40.5,3.5])
		rotate([-90,0,0])
			cylinder(h=8,r=1,$fn=100);
}
}


// Opto board

translate([-10,-40,-7.5])
{
rotate([-90,-90,0])
{
translate([11.5,6.95,0])
difference()
{
	color("black",a=1.0)
		cube([14,6.1,10]);
	translate([4.5,-0.5,2.5])
		color("gray",a=1.0)
			cube([5,7,8]);
}
difference()
{
	translate([0,0,-1.6])
		color("green",a=1.0)
			cube([30,20,1.6]);
	translate([4,4,-2])
		cylinder(h=2.5,r=1.5,$fn=100);
	translate([4,16,-2])
		cylinder(h=2.5,r=1.5,$fn=100);
}
}
}

// Motor

translate([0,0,-18])
	color("gray",a=0.1)
		cylinder(h=20,r=26,$fn=100);
color("gray",a=0.1)
	cylinder(h=30,r=4,$fn=100);


