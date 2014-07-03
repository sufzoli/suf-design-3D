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

