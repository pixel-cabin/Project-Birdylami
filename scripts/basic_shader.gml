///basic_shader(shadertype)
var icolor = make_color_rgb(149,73,216)
var shadertype = real(argument0)
switch(argument0)
{
case 0: set_temp_blend(image_blend,c_black,1,false); break; //SILHOUETTES
case 1: set_temp_blend(image_blend,c_ltgray,0.7,false); break; //GLOOMY
case 2: set_temp_blend(image_blend,c_blue,0.7,false); break; //RAINY WEATHER
}
