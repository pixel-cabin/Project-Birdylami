///daycycle_blend_globals()
icolor = make_color_rgb(149,73,216)
switch(global.time_phase)
{
case "night": set_temp_blend(image_blend,icolor,0.2,true); break;
case "transition": set_temp_blend(image_blend,c_orange,0.7,true); break;
case "day": set_temp_blend(image_blend,c_aqua,0.2,true); break;
}
