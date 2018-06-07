///move_wave(horizontal?,vertical?,amplitude,increment)
shift = 0
t = 0
xx = x;
yy = y;
usehor = argument0
usever = argument1
amplitude = argument2
increment = argument3
t += increment


if (usehor = true || usehor = 1) 
    {
    x = xx + amplitude*cos(t * pi / 360);
    }
    
if (usever = true || usever = 1) 
    {
    y = yy + amplitude*sin(t * pi / 360);
    }
    
    
