graphx+=1
surface_reset_target();
draw_clear(c_black)
draw_set_blend_mode_ext(bm_one, bm_zero);
surface_reset_target()

switch (global.effect) //Chooses a screen effect based on the value of global.effect
{

/*This is the basic screen-scaling effect. nothing fancy, but very helpful.
I didn't create this effect; credit goes to ChevyRay, whose surface tutorial made it possible for me to figure out how to do 
anything at all with surfaces. For more on how to use this effect and other stuff about surfaces check out his
tutorial: http://forums.tigsource.com/index.php?topic=3142.msg86809#msg86809
*/
case "none": 
{
draw_surface_stretched(screen[0,0],screen_x,screen_y,screen_w*screen_scale_w,screen_h*screen_scale_h);
surface_reset_target()
break;
}

/*The horizontal wave effect. With this effect, the screen gets a wavey effect across it.
This is based on a few variables. wave_height[#], which determines how far the waves go out in either direction; wave_width[#], which
determines how long of a distance it takes for the waves to go back and forth; part[#,i], which determines the location of the surfaces 
used to make the waves(x if using vertical waves, y if horizontal waves); part_thickness[#], which determines the how tall or wide 
or how smooth the waves are( part_thickness is changed using part_num (a smaller number equals thicker waves)); and finally, graphx, 
which is used to make the waves move (increase the number added to make faster waves).
*/
case "hwave":
{
surface_set_target(screen[1,1])
for (i = 0; i < part_num[1]; i += 1)
{
draw_surface_part(screen[1,0],0,part[1,i],view_wview,part_thickness[1],(wave_height[1]*sin((graphx*wave_width[1])+part[1,i])),part[1,i])
}
surface_reset_target()
draw_surface(screen[1,1],0,0)
break;
}

/*This is basically the same as the horizontal wave effect, except that the waves move up and down. Just change the variables for it
in screen_init().
*/
case "vwave":
{
surface_set_target(screen[1,1])
for (i = 0; i < part_num[2]; i += 1)
{
draw_surface_part(screen[1,0],part[2,i],0,part_thickness[2],view_hview,part[2,i],(wave_height[2]*sin((graphx*wave_width[2])+part[2,i])))
}
surface_reset_target()
draw_surface(screen[1,1],0,0)
break;
}
}

draw_set_blend_mode(bm_normal)
