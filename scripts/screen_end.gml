switch (global.effect)
{

case "none": 
{
surface_set_target(screen[0,0])
surface_reset_target()
break;
}

case "hwave":
{
surface_set_target(screen[1,0])
surface_reset_target()
break;
}

case "vwave":
{
surface_set_target(screen[1,0])
surface_reset_target()
break;
}
}

