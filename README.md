# Highly Configurable Wheel
A highly customizable wheel STL generator, with multiple tread and spoke patters, suitable for robotics projects and home printing. Create your own version using the customizer at https://www.thingiverse.com/thing:21486

## Table of Contents
- [Summary](#summary)
- [Instructions](#instructions)
- [Tire Parameters](#tire-parameters)
- [Rim Parameters](#rim-parameters)
- [Tread Parameters](#tread-parameters)
- [Spoke-related Parameters](#spoke-related-parameters)
- [Hub Parameters](#hub-parameters)
- [Quality Parameters](#quality-parameters)
- [Version History](#version-history)
- [Donation](#donation)

## Summary 
This is very highly customizable wheel in the way of an OpenSCAD file with 46 parameters that provides a virtually limitless set of combinations and wheel designs. I affectionately refer to it as "One Wheel To Rule Them All."

It can be wide, narrow, big, little, fat hub, skinny hub, no hub, through-hole, servo arm mounted, chamfered, multi-tire, modeled tread, optical encoder-slotted, and more. It even accommodates stretched o-ring tires. It just can't be square, because my sources tell me that won't roll well. The code is extensively documented, and traces out helpful information about the geometry of the wheel/tire, as well as encoder slot metrics (e.g. each rising edge is 42.42mm/1.67in in travel).

It includes twelve standard tread patterns (all configurable in often surprising ways), eight core spoke patterns (also highly customizable), configurable support for o-rings, bands, and optical encoder timing slots (directional and non-directional), and a lot more. Plus, Iâ€™m still adding features as I think of them.

The images show most of the core building blocks, plus just a few random variations. Some of the settings produce unique and creative designs that don't even really match the descriptions. As an example, see the few spiral designs pictured separately.

To put it a different way, the tread and spoke designs are not limited to what you see. For example, you can easily stretch the length, width and height of each knob, and their relative positions to create new variations.

This design combines all my previous wheel designs and adds a lot of new features. For an easier-to-read version of the instructions, see my blog at http://www.thefrankes.com/wp/?p=2674.

## Instructions
For an easier-to-read and up-to-date version of the instructions, see my blog at http://www.thefrankes.com/wp/?p=2674.

Here it is on github: https://github.com/alexfranke/Highly-Configurable-Wheel

**Get the code from the source directory.** You can now find the older versions in there, too -- I'll be removing them from here so people don't get confused and download the wrong one.

In the 1.33 update: JoeyC added some nice features here to support vanes. Thanks!

In the 1.32 update: Added features suggested by JuliaDee: option for v-grooves instead of just, and flatted shaft option (with `shaftFlatDiameter` parameter). Check comments under Tread Parameters for how to use `v-groove`. Fixed a bug that cause outer nut trap to not render properly. Fixed a bug that didn't include shaft flats when rendered without a hub.

In the 1.23 update: Fixed a bug that places the trapped nuts incorrectly, without considering shaft size. Added a parameter to offset the placement of these nuts. (Thanks, AUGuru, for both of these!)

In the 1.22 update: Added credits section to instructions. Fixed some argument/reference issues. Better knob foundation calculation/rendering. Fixed a number of bugs in knob sizing, including the bug indetified by TakeItAndRun, where the knobs sometimes extend into the interior of the wheel.

In the 1.21 update: Fixed bug that prevented timing holes from rendering properly with spoke inset. Edited comments a bit and cleaned up some code. Combined a few parameters. 

In the 1.2 update: Line style uses `spokeWidth`. Supports an inner circle using `innerCircleDiameter`. Cleaned up some unnecessary code. Added spokeInset to allow seperate sized of rim and rest of wheel. Added captive nut option in hub. Added convexity of spoke area (inner and outer).

In the 1.1 update: Hub now supports standard hobby servo mounting arms/horns. Renders flat.

It's important to note that you can configure this wheel to such an extend that it may not be printable at home with extruded plastic printers. In these cases, services such as Shapeways could come in handy.

***Remember to see the website for the most up to date instructions.

## Tire Parameters
Often wheels are built around the tires. In this section, specify the properties of the tires you're using, and this will define the diameter of the wheel. If you're using o-rings, the `tireCSDiameter` should be the cross-section diameter of the o-ring, or if you're using some other flat tire material (such as rubber bands), just specify the its thickness. If you're not using any tire at all, set the `tireCSDiameter` to zero.

- `wheelWidth`: The width (or thickness) of the the wheel
- `tireCSDiameter`: Cross-sectional diameter (CS) -- How thick is the tire rubber?
- `tireID`: Internal diameter (ID) -- How wide is the inside opening?
- `tireStretch`: Circumferential stretch percentage (usually 1 + 0-5%) -- How much to you want to stretch it to get it on?

## Rim Parameters
The rim sits at at the outside of the spokes and supports the tires or added treads. Installed tires (such as o-rings, rubber bands, etc) are set into grooves carved out of the rim, while treads are added onto it. Keep this in mind when you're using tires -- as an example, the rim height should not be smaller than the radius of o-ring tires.

The rim also supports rotary encoder timing holes for wheel feedback. Use the padding parameters to adjust the location of those holes. See the compiler output for helpful information about the distance indicated by each timing hole. Directional timing holes will produce a second set of holes that are 90 degrees out of phase with the first. This allows you to stack sensors at the same location over the wheel instead of trying to position them along the circumference. Directional timing holes essentially double the resolution. You can also double resolution by looking for both rising and falling edges.

- `rimHeight`: The height of the rim portion of the wheel
- `timingHoles`: The number of timing holes to carve into the rim
- `timingHoleInPad`: The inside padding for the timing holes
- `timingHoleMidPad`: The middle padding if direction timing holes is selected
- `timingHoleOutPad`: The outside padding for the timing holes
- `directional`: A directional encoder renders two sets of slots, 90 deg out of phase

## Tread Parameters
In this section, specify the properties of the tire tread you want to render. If you're using a wheel (e.g. o-ring, rubber bands, etc), then use either the `o-rings` or `slots` settings, which will cut a groove (or grooves) in the wheel rim to fit the tires. The othertreat styles will render a tread pattern protruding out from the tire surface by the amount you specify in third part of `knobSize`.

Imagine the tire is mounted on a robot and facing straight at you. The `knobSize` parameter defines the size and shape of knobs in an [x,y,z] format, where x goes across the rim, y goes up and down along the perimeter of the wheel, and z protrudes out from the wheel toward you.

The `staggerOffset` parameter allows you to stagger knobs across the tire by an amount you specify. Set this to zero if you want all the knobs lined up along the perimeter and aligned with the edges of the rim.

`numberOfKnobs` specifies how many knobs there are across the tire, and `lineThickness` specifies how thick the lines are from "drawn" tire styles, such as `x`, `cross`, and `zigX`. You can use these pameters together in creative ways -- for example to extend a single tread profile across the width of the tire, or to create a contiguous zig-zag.

Finally, `radialTreadSets` defines how many sets of treads are rendered around the wheel. Each set contains two rows in order to create the staggered effect.

- `treadStyle`: none, cross, o-rings, squares, spheres, cylindersX, cylindersY, cylindersZ, spikes, slots, x, zigX, v
- `knobSize`: The size of each knob [across wheel, along the perimeter, prodruding]
- `radialTreadSets`: How many sets of treads to render around the wheel (2 rows per set).
- `numberOfKnobs`: The number of knobs to render per row.
- `staggerOffset`: A distance to offset the staggered rows.
- `lineThickness`: The line thickness for "drawn" styles, such as `x` and `zigX`
- `maxTires`: For o-rings, the maximum number of tires per wheel
- `spaceBetweenTires`: For o-rings, the space between each tire, if there are more than one

Tread styles are:

- `none`: No tread is rendered
- `cross`: Each knob is the shape of a plus sign with the specified `lineThickness`
- `o-rings`: Grooves are cut into the rim to accept o-ring tires
- `squares`: Each knob is a rectangle, whose size is specified by `knobSize`
- `spheres`: Each knob is a smooth bump, whose size is specified by `knobSize`
- `cylindersX`: Each knob is a cylindrical shape running across the wheel, whose size is specified by `knobSize`
- `cylindersY`: Each knob is a cylindrical shape running along the perimiter of the wheel, whose size is specified by `knobSize`
- `cylindersZ`: Each knob is a cylindrical shape protruding from the surface of the wheel, whose size is specified by `knobSize`
- `spikes`: Each knob is a cone or spike protruding from the surface of the wheel, whose size is specified by `knobSize`
- `slots`: Grooves are cut into the rim to accept flat tires, defined by numberOfKnobs (number of grooves), the first and third numbers in knobSize to define the width of the slots and the depth, and `spaceBetweenTires` for the distance between the tires and also from the outside edges to the first slots.
- `x`: Each knob is in the shape of an "x" protruding from the surface of the wheel, whose size is specified by `knobSize`
- `zigX`: Each knob is in the shape of a zig-zag protruding from the surface of the wheel, whose size is specified by `knobSize`
- `v`: Each knob is in the shape of a "v" protruding from the surface of the wheel, whose size is specified by `knobSize`

## Spoke-related Parameters
This section is used to define the spoke style of the wheel. Some of the properties are only applicable to certain wheel types, and these properties can be used together in creative ways to create a wide range of tire designs.

The `proportion` property affects how some spokes are rendered. The first number is the proportion of the design from the center of the wheel to the inside of the rim, and the second number is the proportion of the width inside of the wheel. For example, to create spokes that are roughly in the shape of a "U", you can use a `circle` style, and set the proportion to [1.5, 1.0], for cirle spokes that are 150% as long as the distance from the center to the inside of the rim, 100% as wide.

- `spokeStyle`: Any of the styles from the list below (e.g. `biobazard` or `line`)
- `numberOfSpokes`: Number of "spokes." Set this to three if you're doing the biohazard design
- `spokeWidth`: This is how wide each spoke is.
- `proportion`: proportion to rim, proportion of width
- `curvature`: For `spiral`, this is how curvey the spokes are. >0, but
- `reverse`: For `spiral`, setting this to "true" reverses the direction of the spirals
- `outerHoleDiameter`: For `circlefit`, the diameter of the outer holes, or zero for none

The spoke styles are:

- `biohazard`: A biohazard logo-inspired design. Set `numberOfSpokes` to 3 to mimic the logo.
- `circle`: Spokes in a circlar or oval form, defined by `spokeWidth` and `proportion`.
- `circlefit`: The maximum number of circles that will fit between the center and the rim, with a set of smaller outer circles specified by `outerHoleDiameter`.
- `diamond`: Spokes in the shape of a diamond (rhombus), defined by `spokeWidth` and proportion.
- `fill`: Fills in the spoke area with a solid cylinder.
- `line`: Straight line spokes, like you would see on a typical wagon wheel.
- `none`: Leaves the spoke area empty and does not make for a very useful wheel.
- `rectangle`: Spokes in the shape of a rectangle, defined by `spokeWidth` and `proportion`.
- `spiral`: Spokes in the shape of a semicircle, defined by `curvature`, `reverse`, `spokeWidth`.



## Hub Parameters
These properties define the hub -- or how the wheel connects to the motor. The default values for the captive nut are precise for a M3 nut and will make the nut a very tight (if not impossible) fit. I prefer this because it allows you to "melt" the nut into place with a soldering iron. However, if you don't have a solder iron or prefer a looser fit, then just adjust the nut diameter and thickness. (M3 hardware is, by default, set to 3mm screw diameter, 5.4mm nut diameter, and 2.3mm nut thickness.) Similarly, the holes for the motor shaft and grub screw are also precise. This allows the holes to be drilled out for a more precise fit. Again, you can adjust these to suit your needs.

The `hubZOffset` can be used to "sink" the hub into the wheel, and it defaults to half the wheel thickness. For example, when the `hubHeight` is 10 and the `hubZOffset` is -2, then the hub will protrude 8mm from the wheel, but the shaft hole will be 10mm deep. The set screw will still be positioned in the middle of the exposed vertical height, and the fillet/chamfer will also be rendered in the correct position. This property is also useful if you want to poke a hole entirely through the wheel. (e.g. If the wheel is 6mm thick, set the hub height to 16 and the `hubZOffset` to -6, and you'll get a hub that protrudes 10mm from the wheel surface with a hole that extends all the way through the wheel.)

To mount a servo motor, set `includeHub` to false, set `shaftDiameter` so that the hole will accommodate the servo horn screw and any bit that protrudes from the top of the servo horn. Then set the `servoHoleDiameter` to the size of your mounting hardware, and set `servoHoleDistance1` and `servoHoleDistance2` to the total distance between mounting holes on your servo (not the distance from the center). These sets of mounting holes will be rendered at 90 degree angles from one another. If you only want one set of holes, set one of the values to zero. Adjust the angle of all the holes to avoid openings in your wheel design if necessary using `servoArmRotation`.

- `includeHub`: Set to false to remove the hub and only include the shaft diameter hole.
- `hubDiameter`: The diameter of the hub portion of the wheel
- `hubHeight`: The total height of the hub
- `hubZOffset`: The Z position of the hub, negative numbers from the surface of the wheel
- `shaftDiameter`: The diameter of the motor shaft
- `setScrewCount`: The number of set screws/nuts to render, spaced evenly around the shaft
- `setScrewDiameter`: The diameter of the set screw. 3 is the default for an M3 screw.
- `setScrewNutDiameter`: The "diameter" of the captive nut, from flat to flat (the "in-diameter")
- `setScrewNutThickness`: The thickness of the captive nut
- `baseFilletRadius`: The radius of the fillet (rounded part) between the hub and wheel.
- `topFilletRadius`: The radius of the fillet (rounded part) at the top of the hub.
- `chamferOnly`: Set to true to use chamfers (straight 45-degree angles) instead of fillets.

## Quality Parameters 
- `$fn`: Default quality for most circle parts.

## Version History 
- v1.33 11/8/12 4:13PM EDT. Vane support by JoeyC.
- v1.32 6/9/12 4:13PM EDT. (+v-grooves +flats)
- v1.23 4/23/12 1:52AM EDT. 
- v1.22 4/21/12 6:38PM EDT. 
- v1.21 4/18/12 1:16AM EDT. 
- v1.2 4/17/12 11:56PM EDT.
- v1.1 4/16/12 7:16PM EDT.

## Donation 
Buy me a beer. :) 
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate/?hosted_button_id=PUKYPBDC4TN9Y)
 

