///fire_random(amount,sizemin,sizemax,xmax,ymax,startalpha,vanishspeed,init-hspeed,init-vspeed,mygrv,usernxy)

var amount = argument0
var sizemin = argument1 
var sizemax = argument2
var xmax = argument3
var ymax = argument4
var startalpha = argument5
var vanspd = argument6
var inithsp = argument7
var initvsp = argument8
var omygrv = argument9
var usexy = argument10

if usexy != "no" {
xmax = xmax-(random(real(xmax))*2)}
if usexy != "no"
ymax = ymax-(random(real(ymax))*2)
repeat(amount) {
if usexy != "no" {
xmax = xmax-(random(real(xmax))*2)}
if usexy != "no"
ymax = ymax-(random(real(ymax))*2)
with(instance_create(x+xmax,y+ymax,fireobj))
{
if startalpha > 0 { myalpha = startalpha }
mygrv = random_range(omygrv,omygrv+omygrv)
hspeed = random(inithsp)-(random(inithsp)*2)
vspeed = random(initvsp)
image_xscale = random_range(sizemin,sizemax)
image_yscale = image_xscale
vanish = random(vanspd)
}
}



// startalpha,vanishspeed,inithsp,initvsp
