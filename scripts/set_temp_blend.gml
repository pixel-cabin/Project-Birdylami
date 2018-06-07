///set_temp_blend(image_blend,newcolor,alpha,useglobals)
myblend = argument0
mycolor = argument1
myalpha = argument2
boolean = string(argument3)
global.tilecolor1alpha = myalpha
switch(boolean)
{
case "false": image_blend = merge_color(myblend,mycolor,myalpha); break;
case "true": image_blend = merge_color(myblend,mycolor,global.tilecolor1alpha); break;
default: image_blend = merge_color(myblend,mycolor,myalpha);
}
