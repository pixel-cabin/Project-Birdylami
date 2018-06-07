///daycycle_blend()
icolor = make_color_rgb(149,73,216)
switch(global.time_phase)
{
case "night": set_temp_blend(image_blend,icolor,0.1,false); break;
case "transition": set_temp_blend(image_blend,c_orange,0.7,false); break;
case "day": set_temp_blend(image_blend,c_white,0,false); break;
}
