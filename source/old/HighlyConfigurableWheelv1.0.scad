/*
 * Highly Configurable Wheel (One Wheel To Rule Them All)
 *
 * by Alex Franke (CodeCreations), Apr 2012
 * http://www.theFrankes.com
 * 
 * Licenced under Creative Commons Attribution - Non-Commercial - Share Alike 3.0 
 * 
 * INSTRUCTIONS: Choose some values in the "User-defined values" section, render, print, smile
 *     broadly, share with friends, and send the author a few bottles of your favorite beer. 
 * 
 * v1.00, Apr 15, 2012: Initial release. This is a combination of several other several other 
 *     wheel designs that all used the same framework, including http://www.thingiverse.com/thing:21277
 *     http://www.thingiverse.com/thing:21065, http://www.thingiverse.com/thing:21064, and 
 *     http://www.thingiverse.com/thing:21010, as well as some parts of my encoder wheel design at 
 *     http://www.thingiverse.com/thing:20491. I should be finishing my taxes right now. 
 */

/////////////////////////////////////////////////////////////////////////////
// User-defined values... 
/////////////////////////////////////////////////////////////////////////////

// Tire Parameters:
//      Often wheels are built around the tires. In this section, specify the properties of the 
//   tires you're using, and this will define the diameter of the wheel. If you're using o-rings, 
//   the tireCSDiameter should be the cross-section diameter of the o-ring, or if you're using some
//   other flat tire material (such as rubber bands), jsut specify the its thickness. If you're not
//   using any tire at all, set the tireCSDiameter to zero. 

wheelWidth     = 20;    // The width (or thickness) of the the wheel.
tireCSDiameter = 7;     // Cross-sectional diameter (CS) -- How thick is the tire rubber?
tireID         = 93;    // Internal diameter (ID) -- How wide is the inside opening? 
tireStretch    = 1.00;  // Circumferential stretch percentage (usually 1 + 0-5%) -- How much to 
                        //   you want to stretch it to get it on? 

// Rim properties 
//      The rim sits at at the outside of the spokes and supports the tires or added treads. 
//   Installed tires (such as o-rings, rubber bands, etc) are set into grooves carved out of the
//   rim, while trads are added onto it. Keep this in mind when you're using tires -- as an 
//   example, the rim height should not be smaller than the radius of o-ring tires. 
//      The rim also supports rotary encoder timing holes for wheel feedback. Use the padding 
//   parameters to adjust the location of those holes. See the compiler output for helpful 
//   information about the distance indicated by each timing hole. Directional timing holes 
//   will produce a second set of holes that are 90 degrees out of phase with the first. This 
//   allows you to stack sensors at the same location over the wheel instead of trying to 
//   position them along the circumference. Directional timing holes essentially double the 
//   resolution. You can also double resolution by looking for both rising and falling edges. 

rimHeight        = 9;     // The height of the rim portion of the wheel. 
timingHoles      = 0;     // The number of timing holes to carve into the rim
timingHoleInPad  = 1;     // The inside padding for the timing holes
timingHoleMidPad = .5;     // The middle padding if direction timing holes is selected
timingHoleOutPad = 2;     // The outside padding for the timing holes 
directional      = true;  // A directional encoder renders two sets of slots, 90 deg out of phase

// Tread Parameters:
//      In this section, specify the properties of the tire tread you want to render. If you're 
//   using a wheel (e.g. o-ring, rubber bands, etc), then use either the "o-rings" or "slots" 
//   settings, which will cut a groove (or grooves) in the wheel rim to fit the tires. The other
//   treat styles will render a tread pattern protruding out from the tire surface by the amount 
//   you specify in third part of "knobSize".
// 		Imagine the tire is mounted on a robot and facing straight at you. The "knobSize" parameter
// 	 defines the size and shape of knobs in an [x,y,z] format, where x goes across the rim, y 
//   goes up and down along the perimeter of the wheel, and z protrudes out from the wheel toward
//   you. 
// 		The "staggerOffset" parameter allows you to stagger knobs across the tire by an amount you
//   specify. Set this to zero if you want all the knobs lined up along the perimeter and aligned 
//   with the edges of the rim. 
// 		"numberOfKnobs" specifies how many knobs there are across the tire, and "lineThickness" 
// 	 specifies how thick the lines are from "drawn" tire styles, such as "x", "cross", and "zigX". 
// 	 You can use these pameters together in creative ways -- for example to extend a single tread 
//   profile across the width of the tire, or to create a contiguous zig-zag. 
//  		Finally, "radialTreadSets" defines how many sets of treads are rendered around the wheel. 
// 	 Each set contains two rows in order to create the staggered effect. 
// 	    Tread styles are: 
// 		 * none - No tread is rendered 
// 		 * cross - Each knob is the shape of a plus sign with the specified lineThickness
// 		 * o-rings - Grooves are cut into the rim to accept o-ring tires
// 		 * squares - Each knob is a rectangle, whose size is specified by knobSize
// 		 * spheres - Each knob is a smooth bump, whose size is specified by knobSize
// 		 * cylindersX - Each knob is a cylindrical shape running across the wheel, whose size 
// 				is specified by knobSize
// 		 * cylindersY - Each knob is a cylindrical shape running along the perimiter of the wheel, 
// 				whose size is specified by knobSize
// 		 * cylindersZ - Each knob is a cylindrical shape protruding from the surface of the wheel, 
// 				whose size is specified by knobSize
// 		 * spikes - Each knob is a cone or spike protruding from the surface of the wheel, whose
// 				size is specified by knobSize
// 		 * slots - Grooves are cut into the rim to accept flat tires, defined by numberOfKnobs
//               (number of grooves), the first and third numbers in knobSize to define the 
//               width of the slots and the depth, and spaceBetweenTires for the distance between
//               the tires and also from the outside edges to the first slots. 
// 		 * x - Each knob is in the shape of an "x" protruding from the surface of the wheel, whose
// 				size is specified by knobSize
// 		 * zigX - Each knob is in the shape of a zig-zag protruding from the surface of the wheel, 
// 				whose size is specified by knobSize
// 		 * v - Each knob is in the shape of a "v" protruding from the surface of the wheel, whose 
// 				size is specified by knobSize

treadStyle        = "o-rings";  // none, cross, o-rings, squares, spheres, cylindersX, 
                                // 	cylindersY, cylindersZ, spikes, slots, x, zigX, v
knobSize          = [5,4,1];    // The size of each knob [across wheel, along the perimeter, prodruding]
radialTreadSets   = 5;          // How many sets of treads to render around the wheel (2 rows per set).
numberOfKnobs     = 2;          // The number of knobs to render per row. 
staggerOffset     = 2;          // A distance to offset the staggered rows. 
lineThickness     = 1;          // The line thickness for "drawn" styles, such as "x" and "zigX"
maxTires          = 5;          // For o-rings, the maximum number of tires per wheel
spaceBetweenTires = 0.25;       // For o-rings, the space between each tire, if there are more than one 

// Spoke-related Parameters:
//      This section is used to define the spoke style of the wheel. Some of the properties are only 
//   applicable to certain wheel types, and these properties can be used together in creative ways 
//   to create a wide range of tire designs. 
//      The "proportion" property affects how some spokes are rendered. The first number is the 
//   proportion of the design from the center of the wheel to the inside of the rim, and the second 
//   number is the proportion of the width inside of the wheel. For example, to create spokes that are 
//   roughly in the shape of a "U", you can use a "circle" style, and set the proportion to [1.5, 1.0], 
//   for cirle spokes that are 150% as long as the distance from the center to the inside of the rim, 
//   100% as wide. 
//      The spoke styles are: 
//       * biohazard - A biohazard logo-inspired design. Set numberOfSpokes to 3 to mimic the logo.
//       * circle - Spokes in a circlar or oval form, defined by spokeWidth and proportion. 
//       * circlefit - The maximum number of circles that will fit between the center and the rim, 
//                with a set of smaller outer circles specified by outerHoleDiameter. 
//       * diamond - Spokes in the shape of a diamond (rhombus), defined by spokeWidth and proportion. 
//       * fill - Fills in the spoke area with a solid cylinder. 
//       * line - Straight line spokes, like you would see on a typical wagon wheel. 
//       * none - Leaves the spoke area empty and does not make for a very useful wheel.  
//       * rectangle - Spokes in the shape of a rectangle, defined by spokeWidth and proportion. 
//       * spiral - Spokes in the shape of a semicircle, defined by curvature, reverse, spokeWidth. 

spokeStyle        = "circlefit";  // none, biohazard, circle, circlefit, diamond, line, rectangle, spiral, fill
numberOfSpokes    = 3;          // Number of "spokes." Set this to three if you're doing the biohazard design
spokeWidth        = 5;          // This is how wide each spoke is.
proportion        = [1.5,1.0];  // proportion to rim, proportion of width
curvature         = 0.66;       // For "spiral", this is how curvey the spokes are. >0, but <=1, where 
                                //     1 is a half circle
reverse           = false;      // For "spiral", setting this to "true" reverses the direction of the spirals
outerHoleDiameter = 13;         // For "circlefit", the diameter of the outer holes, or zero for none

// Hub Parameters: 
//      These properties define the hub -- or how the wheel connects to the motor. The default values 
//   for the captive nut are precise for a M3 nut and will make the nut a very tight (if not impossible) 
//   fit. I prefer this because it allows you to "melt" the nut into place with a soldering iron. However, 
//   if you don't have a solder iron or prefer a looser fit, then just adjust the nut diameter and 
//   thickness. (M3 hardware is, by default, set to 3mm screw diameter, 5.4mm nut diameter, and 2.3mm 
//   nut thickness.) Similarly, the holes for the motor shaft and grub screw are also precise. This 
//   allows the holes to be drilled out for a more precise fit. Again, you can adjust these to suit 
// 	 your needs. 
//      The hubZOffset can be used to "sink" the hub into the wheel, and it defaults to half the wheel 
//   thickness. For example, when the hubHeight is 10 and the hubZOffset is -2, then the hub will 
//   protrude 8mm from the wheel, but the shaft hole will be 10mm deep. The set screw will still be
//   positioned in the middle of the exposed vertical height, and the fillet/chamfer will also be rendered 
//   in the correct position. This property is also useful if you want to poke a hole entirely through the
//   wheel. (e.g. If the wheel is 6mm thick, set the hub height to 16 and the hubZOffset to -6, and 
//   you'll get a hub that protrudes 10mm from the wheel surface with a hole that extends all the way 
//   through the wheel.)

includeHub           = true;  // Set to false to remove the hub and only include the shaft diameter hole. 
hubDiameter          = 15;    // The diameter of the hub portion of the wheel
hubHeight            = 15;    // The total height of the hub
hubZOffset           = -5;    // The Z position of the hub, negative numbers from the surface of the wheel 
shaftDiameter        = 4;     // The diameter of the motor shaft

setScrewCount        = 1;     // The number of set screws/nuts to render, spaced evenly around the shaft 
setScrewDiameter     = 3;     // The diameter of the set screw. 3 is the default for an M3 screw. 
setScrewNutDiameter  = 5.4;   // The "diameter" of the captive nut, from flat to flat (the "in-diameter")
setScrewNutThickness = 2.3;   // The thickness of the captive nut

baseFilletRadius     = 0;     // The radius of the fillet (rounded part) between the hub and wheel. 
topFilletRadius      = 2;     // The radius of the fillet (rounded part) at the top of the hub. 
chamferOnly          = false; // Set to true to use chamfers (straight 45-degree angles) instead of fillets. 

// Quality Parameters: 

$fn = 50;  // Default quality for most circle parts. 


/////////////////////////////////////////////////////////////////////////////
// Calculated values... 
/////////////////////////////////////////////////////////////////////////////

// Let's get some basic math out of the way first.
// Not all of these are necessary, but many are helpful to know and will be echoed to the user. 

// Some basic tire geometry
innerDiameter = tireID; 
centerDiameter = tireID + tireCSDiameter;
outerDiameter = tireID + ( tireCSDiameter *2 );
innerCircumference = innerDiameter*PI;
centerCircumference = centerDiameter*PI;
outerCircumference = outerDiameter*PI;

// Stretched tire geometry
centerCircumferenceStretched = centerCircumference * tireStretch;
centerDiameterStretched = centerCircumferenceStretched/PI; 
innerDiameterStretched = centerDiameterStretched - tireCSDiameter;
outerDiameterStretched = centerDiameterStretched + tireCSDiameter;
innerCircumferenceStretched = innerDiameterStretched * PI;
outerCircumferenceStretched = outerDiameterStretched * PI;

// Wheel geometry.
wheelDiameter =  centerDiameterStretched;
wheelRadius = wheelDiameter / 2;
tireRadius = tireCSDiameter / 2;
hubRadius = hubDiameter / 2;

// Knobbed wheel geometry
outerDiameterKnobbed = wheelDiameter+(2*knobSize[2]);
outerCircumferenceKnobbed = outerDiameterKnobbed * PI;


/////////////////////////////////////////////////////////////////////////////
// Report some basic information to the user...  
/////////////////////////////////////////////////////////////////////////////

// Some tire data, stretched and unstretched 
echo( str("Tire cross-sectional diameter is ", tireCSDiameter ) ); 
echo( str("Tire circumferential stretch is ", tireStretch ) ); 

echo( str("Tire (unstretched): [inner, center, outer]" ) ); 
echo( str("  * Diameter: ", innerDiameter, ", ", centerDiameter, ", ", outerDiameter ) ); 
echo( str("  * Circumference: ", round2(innerCircumference), ", ", round2(centerCircumference), 
	", ", round2(outerCircumference) ) ); 

echo( str("Tire Stretched: [inner, center, outer]" ) ); 
echo( str("  * Diameter: ", round2(innerDiameterStretched), ", ", round2(centerDiameterStretched), 
	", ", round2(outerDiameterStretched) ) ); 
echo( str("  * Circumference: ", round2(innerCircumferenceStretched), ", ", 
	round2(centerCircumferenceStretched), ", ", round2(outerCircumferenceStretched) ) ); 

echo( str("Tire Knobbed: [outer]" ) ); 
echo( str("  * Diameter: ", round2(outerDiameterKnobbed) ) ); 
echo( str("  * Circumference: ", round2(outerCircumferenceKnobbed) ) ); 

echo( str("Wheel diameter will be ", wheelDiameter ) ); 

// Here's a helper function that will round a value to two decimal places. 
function round2( value ) = round(value * 100) / 100;


/////////////////////////////////////////////////////////////////////////////
// Render the wheel...  
/////////////////////////////////////////////////////////////////////////////
rotate([0,90,0])
wheel();

module wheel() {

	// Number of tires - If the width is more than 1.5 times with tire CS, then 
	// we can have multiple tires on the wheel, if defined. 
	tireDistance = tireCSDiameter+spaceBetweenTires; 
	numTires = min( maxTires, max( 1, floor( (wheelWidth + (tireDistance)/2) / tireDistance ) ) );
	echo( str("Number of tires will be ", numTires ) ); 

	union() {
		// The rim 
		difference() {
			rim(wheelWidth, rimHeight, wheelDiameter);
	
			// Punch out timing holes	
			if ( timingHoles > 0 ) {
				if ( directional ) {
					assign( holeHeight=(rimHeight-timingHoleInPad-timingHoleOutPad-timingHoleMidPad)/2 ) {
						// outer holes 
						placeTimingHoles(timingHoles, holeHeight, wheelWidth, (wheelDiameter/2)-timingHoleOutPad);

						// inner holes 
						rotate([0,0,90/timingHoles]) 
						placeTimingHoles(timingHoles, holeHeight, wheelWidth, 
							(wheelDiameter/2)-timingHoleOutPad-holeHeight-timingHoleMidPad);
					}	
					assign( len1 = outerCircumferenceStretched/(timingHoles*2), 
		  					len2 = outerCircumferenceKnobbed/(timingHoles*2) ) {
						echo ( str("For o-rings, each timing mark (same edge) is ", round2(len1), "mm (", 
							round2(len1/25.4), "in).") );
						echo ( str("For knobbed treads, each timing mark (same edge) is roughly ", round2(len2), 
							"mm (", round2(len2/25.4), "in).") );
					}
				} else {
					placeTimingHoles(timingHoles, rimHeight-timingHoleInPad-timingHoleOutPad, 
						wheelWidth, (wheelDiameter/2)-timingHoleOutPad);
					assign( len1 = outerCircumferenceStretched/(timingHoles), 
		  					len2 = outerCircumferenceKnobbed/(timingHoles) ) {
						echo ( str("For o-rings, each timing mark (same edge) is ", round2(len1), "mm (", 
							round2(len1/25.4), "in).") );
						echo ( str("For knobbed treads, each timing mark (same edge) is roughly ", round2(len2), 
							"mm (", round2(len2/25.4), "in).") );
					}
				}
			}

			// If we're not including the hub, punch out the shaft hole. Otherwise the hub
			// code will do it. This is done in the spokes section also. 
			if ( !includeHub ) {
				cylinder( r=shaftDiameter/2, h=wheelWidth+1, center=true ); 
			}

			// punch out tires
			if ( treadStyle == "o-rings" ) {
				assign( extent=(numTires-1)*(tireDistance/2) ) {
					for( x=[-extent:tireDistance:extent] ) {
						translate([0,0,x])
							tire( wheelDiameter, tireCSDiameter ); 
					}
				}
			} else if ( treadStyle == "slots" ) {	// punch out slots if necessary 
				assign( separation = (wheelWidth-(numberOfKnobs*knobSize[0])) / (numberOfKnobs+1) ) 
				assign( dist = knobSize[0] + separation ) {
					translate([0,0,-wheelWidth/2] ) 
					for ( i=[0:numberOfKnobs-1] ) {
						translate([0,0,separation+(dist*i)] ) 
						difference() {
							cylinder(r=(wheelDiameter/2), h=knobSize[0]); 
							cylinder(r=(wheelDiameter/2)-knobSize[2], h=knobSize[0]); 
						}
					}
				}
			}
		}
	
		// The spokes
		difference() {
			assign( d = wheelDiameter - (rimHeight*2) ) {
				if ( spokeStyle == "fill" ) { 
					cylinder( h=wheelWidth, r=d/2, center=true );
				} else if ( spokeStyle == "biohazard" ) { 
					biohazardSpokes( d, wheelWidth, numberOfSpokes );
				} else if ( spokeStyle == "circlefit" ) {
					circlefitSpokes( d, hubDiameter, wheelWidth, outerHoleDiameter );
				} else if ( spokeStyle == "line" ) {
					lineSpokes( d, wheelWidth, numberOfSpokes );
				} else if ( spokeStyle == "rectangle" ) {
					rectangleSpokes( d, wheelWidth, spokeWidth, proportion, numberOfSpokes );
				} else if ( spokeStyle == "diamond" ) {
					diamondSpokes( d, wheelWidth, spokeWidth, proportion, numberOfSpokes );
				} else if ( spokeStyle == "circle" ) {
					circleSpokes( d, wheelWidth, spokeWidth, proportion, numberOfSpokes );
				} else if ( spokeStyle == "spiral" ) {
					spiralSpokes( d, wheelWidth, numberOfSpokes,
						spokeWidth, curvature, reverse, spiralSpoke);
				}
			}
			
			// Carve a spot for an inset hub if necessary 
			if ( includeHub ) {
				translate( [0,0,hubHeight/2 + wheelWidth/2 + hubZOffset] )
					cylinder( h=hubHeight, r=hubDiameter/2, center=true );
			} else { 
				cylinder( r=shaftDiameter/2, h=wheelWidth+1, center=true ); 
			}
		}	

		// The hub	
		if ( includeHub ) {
			translate([0,0, hubHeight/2 + wheelWidth/2 + hubZOffset]) 
			hub(hubHeight, hubDiameter, shaftDiameter, 
				setScrewCount, setScrewNutDiameter, setScrewNutThickness, setScrewDiameter, 
				hubZOffset, baseFilletRadius, topFilletRadius, chamferOnly);
		}

		// The tread
		if ( treadStyle == "o-rings" ) {
			for( x=[-(numTires-1)*(tireDistance/2):tireDistance:(numTires-1)*(tireDistance/2)] )
				translate([0,0,x])
					%color("black", 0.5) tire( wheelDiameter, tireCSDiameter ); 
		} else if ( treadStyle == "slots" ) {
			// no need to render anything here... 
		} else {		// The rest are all knob designs 
			placeKnobs( wheelWidth, treadStyle, knobSize, radialTreadSets, numberOfKnobs, 
				staggerOffset, lineThickness ); 
		}
	}
}

module placeTimingHoles( holeCount, holeHeight, wheelWidth, radius ) {
	translate([0,0,-(wheelWidth+1)/2]) {
		for ( i = [0 : timingHoles-1] ) {
		   	 rotate( i*(360/timingHoles), [0, 0, 1])
		   	 arc( holeHeight, wheelWidth+1, radius, degrees =180/timingHoles 
		    	);
		}
	}
}

module placeKnobs( wheelWidth, treadStyle, knobSize, radialTreadSets, numberOfKnobs, staggerOffset, lineThickness ) {
	assign( knobDistance = knobSize[0] + (( wheelWidth - knobSize[0]*numberOfKnobs - staggerOffset ) / 
			(numberOfKnobs-1)) ) {
		
		doTreadSet( wheelWidth, treadStyle, knobSize, radialTreadSets, numberOfKnobs, 
			knobDistance, lineThickness ); 
		rotate([180, 0, 180/radialTreadSets])
			doTreadSet( wheelWidth, treadStyle, knobSize, radialTreadSets, numberOfKnobs, 
				knobDistance, lineThickness ); 
	}
}

// Renders half of the tread. The other half is rendered rotated 180% to produce the stagger offset 
module doTreadSet( wheelWidth, treadStyle, knobSize, radialTreadSets, numberOfKnobs, knobDistance, lineThickness ) {
	translate([0,0,knobSize[0]/2 - wheelWidth/2]) {
		for ( 	i=[0:radialTreadSets-1], 
				j=[0:numberOfKnobs-1]
			) {
		    rotate( i * 360 / radialTreadSets, [0, 0, 1])
		    		translate([wheelDiameter/2, 0, j*knobDistance ])
					doKnob( treadStyle, knobSize, lineThickness ); 
		}
	}
}

// knobSize = [protrusion, height, width ] 
module doKnob( treadStyle, knobSize, lineThickness ) {

	// slots and o-rings are not knob designs

	render()
	if ( treadStyle == "squares" ) {
	    cube([knobSize[2]*2,knobSize[1],knobSize[0]], center=true);
	} else if ( treadStyle == "spheres" ) {
		scale([knobSize[2]/2,knobSize[1]/2,knobSize[0]/2])
	    		sphere(r=1, center=true);
	} else if ( treadStyle == "cylindersX" ) {
		scale([knobSize[2],knobSize[1],knobSize[0]])
		rotate([0,0,90])
	    		cylinder(r=0.5, h=1, center=true);
	} else if ( treadStyle == "cylindersY" ) {
		scale([knobSize[2],knobSize[1],knobSize[0]])
		rotate([90,0,0])
	  		cylinder(r=0.5, h=1, center=true);
	} else if ( treadStyle == "cylindersZ" ) {
		scale([knobSize[2],knobSize[1],knobSize[0]])
		rotate([0,90,0])
	    		cylinder(r=0.5, h=2, center=true);
	} else if ( treadStyle == "spikes" ) {
		translate([knobSize[2]/4,0,0])
		scale([knobSize[2]/2,knobSize[1]/2,knobSize[0]/2])
		rotate([0,90,0])
		union() {
	    		cylinder(r1=1, r2=0, h=1, center=true);
	    		translate([0,0,-1])	// must have a foundation because it's on a curve
		    		cylinder(r=1, h=1, center=true);
		}
	} else if ( treadStyle == "cross" ) {
		union() {
		    	cube([knobSize[2]*2,lineThickness,knobSize[0]], center=true);
		    	cube([knobSize[2]*2,knobSize[1],lineThickness], center=true);
		}
	} else if ( treadStyle == "x" ) {
		assign( len = sqrt( pow(knobSize[0], 2) + pow(knobSize[1], 2)), 
			    theta = atan( knobSize[1]/knobSize[0] ) )
		intersection() {	
			union() {
				rotate([theta,0,0]) 
				    	cube([knobSize[2]*2,lineThickness,len], center=true);
				rotate([-theta,0,0]) 
			    	cube([knobSize[2]*2,lineThickness,len], center=true);
			}

			// Trim to box size 
		    cube([knobSize[2]*2,knobSize[1],knobSize[0]], center=true);
		}
	} else if ( treadStyle == "zigX" ) {
		assign( seglen = sqrt( pow(knobSize[0]/4, 2) + pow(knobSize[1]/2, 2)), 
			    theta = atan( (knobSize[1]/2)/(knobSize[0]/4) ) )
		intersection() {	
			union() {	// extend seglen so patterns match neighboring patterns
				translate([0,-knobSize[1]/4,-knobSize[0]/2 + knobSize[0]/8])
					rotate([theta,0,0]) 
					    	cube([knobSize[2]*2,lineThickness,seglen*2], center=true);
				rotate([-theta,0,0]) 
				    	cube([knobSize[2]*2,lineThickness,seglen*2], center=true);
				translate([0,knobSize[1]/4, knobSize[0]/2 - knobSize[0]/8])
					rotate([theta,0,0]) 
					    	cube([knobSize[2]*2,lineThickness,seglen*2], center=true);
			}

			// Trim to box size 
		    cube([knobSize[2]*2,knobSize[1],knobSize[0]], center=true);
		}
	} else if ( treadStyle == "zigY" ) {
		// not yet implemented
	} else if ( treadStyle == "v" ) {
		assign( seglen = sqrt( pow(knobSize[0]/2, 2) + pow(knobSize[1], 2)), 
			    theta = atan( (knobSize[1])/(knobSize[0]/2) ) )
		intersection() {	
			union() {
				translate([0,0, knobSize[0]/4])
					rotate([-theta,0,0]) 
					    	cube([knobSize[2]*2,lineThickness,seglen], center=true);
				translate([0,0, -knobSize[0]/4])
					rotate([theta,0,0]) 
					    	cube([knobSize[2]*2,lineThickness,seglen], center=true);
			}

			// Trim to box size 
		    cube([knobSize[2]*4,knobSize[1],knobSize[0]], center=true);
		}
	} else if ( treadStyle == "vReverse" ) {
		// not yet implemented
	}
}


/////////////////////////////////////////////////////////////////////////////
// Spoke Styles...  
/////////////////////////////////////////////////////////////////////////////

// TODO: Triangle 

//Diamonds pattern spokes
module diamondSpokes( wheelDiameter, wheelWidth, lineWidth, proportion, numberofSpokes ) {
	echo( "Diamonds Style..." ); 
	intersection() {
		cylinder( h=wheelWidth, r= wheelDiameter/2, center = true ); 

		for (step = [0:numberofSpokes-1]) {
		    rotate( a=step*(360/numberofSpokes), v=[0, 0, 1])
			diamondSpoke( wheelDiameter, wheelWidth, lineWidth, proportion );
		}
	}

}
module diamondSpoke( wheelDiameter, wheelWidth, lineWidth, proportion ) {

	// Let's make the lines the correct thickness even after the transformations 
	// are made... 
	render()
	assign( leg=sqrt( 2*pow(wheelDiameter/4,2 ) ) ) // Euclid rocks. 
	assign( p=(wheelDiameter/2)*proportion[0], q=(wheelDiameter/2)*proportion[1] )
	assign( a=sqrt((p*p)/4 + (q*q)/4) ) 
	assign( h=(p*q)/(2*a) )
	assign( theta=2*asin(q/(2*a)) ) 
	assign( prop=( 2*cos(theta/2)*(h-(2*lineWidth)) ) / ( sin(theta)*p ) ) {
		translate ( [-p/2, 0, 0] ) {
			difference() {
				scale([proportion[0],proportion[1],1]) {
					rotate([0,0,45])
						cube( [leg, leg, wheelWidth], center=true); 
				}

				scale([prop,prop,1]) {
					scale([proportion[0],proportion[1],1]) {
						rotate([0,0,45])  // My wife is the epitome of awesomeness. 
							cube( [leg, leg, wheelWidth+1], center=true); 
					}
				}
			}
		}
	}
}



// Circles pattern spokes
module circleSpokes( wheelDiameter, wheelWidth, lineWidth, proportion, numberofSpokes ) {
	echo( "Circles Style..." ); 
	intersection() {
		cylinder( h=wheelWidth, r=wheelDiameter/2, center = true ); 

		for (step = [0:numberofSpokes-1]) {
		    rotate( a = step*(360/numberofSpokes), v=[0, 0, 1])
			circleSpoke(  wheelDiameter, wheelWidth, lineWidth, proportion );
		}
	}

}
module circleSpoke( wheelDiameter, wheelWidth, lineWidth, proportion ) {
	render()
	assign( ox=(wheelDiameter/2)*proportion[0], oy=(wheelDiameter/2)*proportion[1] )
	assign( ix=ox-(lineWidth*2), iy=oy-(lineWidth*2) ) {
		translate ( [-ox/2, 0, 0] ) {
			difference() {
				scale([proportion[0],proportion[1],1])
					cylinder( r=wheelDiameter/4, h=wheelWidth, center=true); 
				scale([(ix/ox)*proportion[0],(iy/oy)*proportion[1],1])
					cylinder( r=wheelDiameter/4, h=wheelWidth +1, center=true); 
			}
		}
 	}
}


//Rectangle pattern spokes
module rectangleSpokes( wheelDiameter, wheelWidth, lineWidth, proportion, numberofSpokes ) {
	echo( "Rectangles Style..." ); 
	intersection() {
		cylinder( h=wheelWidth, r= wheelDiameter/2, center = true ); 

		for (step = [0:numberofSpokes-1]) {
		    rotate( a = step*(360/numberofSpokes), v=[0, 0, 1])
			rectangleSpoke(  wheelDiameter, wheelWidth, lineWidth, proportion );
		}
	}

}
module rectangleSpoke( wheelDiameter, wheelWidth, lineWidth, proportion ) {
	render()
	assign( ox=(wheelDiameter/2)*proportion[0], oy=(wheelDiameter/2)*proportion[1] )
	assign( ix=ox-(lineWidth*2), iy=oy-(lineWidth*2) ) {
		translate ( [-ox/2, 0, 0] ) {
			difference() {
				cube( [ox, oy, wheelWidth], center=true); 
				cube( [ix, iy, wheelWidth+1], center=true); 
			}
		}
 	}
}


// Spiral pattern spokes 
module spiralSpokes( diameter, wheelWidth, number, spokeWidth, curvature, reverse ) {
	echo( "Spiral Style..." ); 
	intersection() {
		cylinder( h=wheelWidth, r=diameter/2, center = true ); 

		for (step = [0:number-1]) {
		    rotate( a = step*(360/number), v=[0, 0, 1])
			spiralSpoke( wheelWidth, spokeWidth, (diameter/4) * 1/curvature, reverse );
		}
	}
}

// spokeWidth = how thick the spoke should be
// curvature = >0 but <=1, how curved the spoke should be
module spiralSpoke( wheelWidth, spokeWidth, spokeRadius, reverse=false ) {
	render() 
	intersection() {	
		translate ( [-spokeRadius, 0, 0] ) {
			difference() {
				cylinder( r=spokeRadius, h=wheelWidth, center=true ); 
				cylinder( r=spokeRadius-(spokeWidth/2), h=wheelWidth+1, center=true ); 
			}
		}
		if ( reverse ) 
			translate ( [-spokeRadius, -spokeRadius/2, 0] ) 
				cube( [spokeRadius*2,spokeRadius,wheelWidth+1], center=true ); 
		else 
			translate ( [-spokeRadius, spokeRadius/2, 0] ) 
				cube( [spokeRadius*2,spokeRadius,wheelWidth+1], center=true ); 
	}
}

// Biohazard pattern spokes
module biohazardSpokes( diameter, width, number ) {
	echo( "Biohazard Style..." ); 

	scale = (diameter/2) / 88;
	intersection() {
		cylinder( h=width, r= diameter/2, center = true ); 
		scale( [scale, scale, 1] ) {
			for (step = [0:number-1]) {
			    rotate( a = step*(360/number), v=[0, 0, 1])
				biohazardSpoke( width );
			}
		}
	}

}
module biohazardSpoke( width ) {
	render() 
	translate ( [-60, 0, 0] )
	difference() {
		translate ( [10, 0, 0] ) 
			cylinder( h = width, r= 50, center=true ); 
		translate ( [-1, 0, 0] ) // offset a bit so it's manifold
			cylinder( h = width+2, r= 40, center=true ); 
	}
}

// Circlefit pattern spokes 
// Still need the math for placing/sizing the outer holes... let me know if you figure it out and I'll add it. 
module circlefitSpokes( diameter, hubDiameter, width, outerHoleDiameter ) {
	echo( "Circlefit Style..." ); 

	padding = 2; 
	paddedHoleRadius = (diameter-hubDiameter)/4;
	holeRadius = paddedHoleRadius - padding/2;
	hubRadius = hubDiameter/2; 

	// Figure out how many circles will fit. 
	circles = floor(360/(2*(asin(paddedHoleRadius/(paddedHoleRadius+hubRadius)))));
	difference() {
		cylinder( h=width, r= diameter/2, center = true ); 

		for ( i = [0 : circles-1] ) {
		   	 rotate( i * (360/circles), [0, 0, 1])
		   	 translate([hubRadius + paddedHoleRadius, 0, 0])
		   	 cylinder(h=width+1, r=holeRadius, center=true);
		}

		// Smaller holes to conserve filament
	   	rotate( 360/circles/2, [0, 0, 1])
		for ( i = [0 : circles-1] ) {
		   	 rotate( i * (360/circles), [0, 0, 1])
		   	 translate([diameter/2-outerHoleDiameter/2, 0, 0])
		   	 cylinder(h=width+1, r=outerHoleDiameter/2, center=true);
		}
	}
}

// Line pattern spokes
module lineSpokes( diameter, width, number ) {
	echo( "Lines Style..." );
	intersection() {
		cylinder( h=width, r= diameter/2, center = true ); 

		for (step = [0:number-1]) {
		    rotate( a = step*(360/number), v=[0, 0, 1])
			lineSpoke( width );
		}
	}

}
module lineSpoke( width ) {
	translate ( [-60/2, 0, 0] )
	cube( [60, width, width], center=true); 
}


/////////////////////////////////////////////////////////////////////////////
// Modules...  
/////////////////////////////////////////////////////////////////////////////

// The hub (the part that holds the wheel onto the motor
module hub( height, diameter, boreDiameter, 
	nuts, nutDiameter, nutThickness, setScrewDiameter, 
	hubZOffset=0, baseFilletRadius=0, topFilletRadius=0, chamferOnly=false) {

	hubWidth=(diameter-boreDiameter)/2;

	union() {	
		difference() {

			// Main hub shape
			union() {
				difference() {
					union() {
						cylinder( h=height, r=diameter/2, center=true );
			
						// First chamfer the base...
						rotate_extrude() 
							translate([diameter/2,-(height/2)-hubZOffset,0])
								polygon(points=[[0,0],[0,baseFilletRadius],[baseFilletRadius,0]]);
					}
			
					// Chamfer the top...
					rotate_extrude() 
						translate([diameter/2,height/2,0])				
							polygon(points=[[0.5,0.5],[-topFilletRadius-0.5,0.5],[0.5, -topFilletRadius-0.5]]);
			
					// Carve the bottom fillet from the chamfer
					if ( !chamferOnly ) { 
						rotate_extrude() {
							translate([(diameter/2)+baseFilletRadius,
								-(height-(2*baseFilletRadius))/2-hubZOffset,0]) {
								circle(r=baseFilletRadius);
							}
						}
					}
				}

				// Add the fillet back on top of the top chamfer 
				if (!chamferOnly) {
					rotate_extrude() {
						translate([
							(diameter/2)-topFilletRadius,
							(height-(2*topFilletRadius))/2,
							0])				
							circle(r=topFilletRadius);
					}
				}
			}
	
			// Remove the bore
			cylinder( h=height+1, r=boreDiameter/2, center=true ); 
	
			// Remove the captive nut
			for( i=[0:nuts-1] ) {
				rotate([ 0,0, (360/nuts)*i ])
				translate([diameter/4,0, height/2 - (height+hubZOffset)/2]) {
					rotate([0,-90,0]) { 
						captiveNut( nutDiameter, nutThickness, setScrewDiameter, 
							depth=height/2+1, holeLengthTop=hubWidth/2, 
							holeLengthBottom=hubWidth+baseFilletRadius );
					}
				}
			}
		}
	}
}

// The rim (the solid area between the spokes and tire)
module rim( width, height, diameter ) {
	difference() { 
		// rim 
		cylinder( h=width, r=diameter/2, center=true );
	
		// punch out center
		cylinder(h=width+1, r=diameter/2 - height, center=true );
	}
}

// The tire, where "diameter" is the center-to-center diameter (not ID or OD)
module tire( diameter, tireDiameter ) {
	render() {
		rotate_extrude(convexity = 10)
			translate([diameter/2, 0, 0])
				circle(r = tireDiameter/2, $fn=20);
	}
}

// This is the captive nut module I use in several of my designs. 
module captiveNut( inDiameter=5.4, thickness=2.3, setScrewHoleDiameter=3, 
	depth=10, holeLengthTop=5, holeLengthBottom=5 )
{
	side = inDiameter * tan( 180/6 );

	render()
	union() {
		for ( i = [0 : 2] ) {
			rotate( i*120, [0, 0, 1]) 
				cube( [side, inDiameter, thickness], center=true );
		}
	
		translate([depth/2,0,0]) 
			cube( [depth, inDiameter, thickness], center=true );
	
		translate([0,0,-(thickness/2)-holeLengthBottom]) 
			cylinder(r=setScrewHoleDiameter/2, h=thickness+holeLengthTop+holeLengthBottom, $fn=15);
	}
}

// Why is this not easy in openSCAD? :/ This is the same code I use in the encoder wheel
module arc( height, depth, radius, degrees ) {
	// This dies a horible death if it's not rendered here 
	// -- sucks up all memory and spins out of control 
	render() {
		difference() {
			// Outer ring
			rotate_extrude($fn = 100)
				translate([radius - height, 0, 0])
					square([height,depth]);
		
			// Cut half off
			translate([0,-(radius+1),-.5]) 
				cube ([radius+1,(radius+1)*2,depth+1]);
		
			// Cover the other half as necessary
			rotate([0,0,180-degrees])
			translate([0,-(radius+1),-.5]) 
				cube ([radius+1,(radius+1)*2,depth+1]);
		
		}
	}
}


