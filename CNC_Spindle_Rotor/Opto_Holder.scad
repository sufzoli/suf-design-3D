difference()
{
	union()
	{
		cylinder(h=7,r=30,$fn=100);
		// Cable space
		translate([-36,-10,0])
			cube([10,20,7]);
		// PCB Holder
		translate([-10,-38,0])
			cube([20,10,7]);
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
	translate([6,-38.5,3.5])
		rotate([-90,0,0])
			cylinder(h=8,r=1,$fn=100);
	translate([-6,-38.5,3.5])
		rotate([-90,0,0])
			cylinder(h=8,r=1,$fn=100);
}