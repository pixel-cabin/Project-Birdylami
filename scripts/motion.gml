/*
**  USAGE:
**      motion(right, jump, left, forcedhsp, forcedvsp, force);
**
**  AUTHOR:
**      Brian 'brod' Rodriguez
**
**  ARGUMENTS:
**      right       when true, object moves to the right
**      up          when true, object jumps
**      left        when true, object moves to the left
**      forcedhsp   this forces object to move horizontally
**      forcedvsp   this forces object to move vertically
**
**  NOTES:
**      [*]All the variables needed for this
**      script can be found in objTest's create
**      event. Otherwise nothing should need to
**      be changed.
**
**      [*]To make new platforms, just give your
**      objects parSolid or parJumpthrough as
**      their parent index, and they'll act
**      accordingly.
**
**      [*]You MUST credit me, Brod, if you use
**      this engine in your project. It took me
**      a long time to make, and you don't wanna
**      make me sad, right? :(
*/


// CONTROLS
/////////////

if(argument0-argument2==1) {
    spr_dir = 1;
    hsp     = min(max_spd,hsp+acc_spd);
}

if(argument1==1) {
    if(free==0 && hold==0 && vsp ==0) {
        vsp = 0
        vsp  = jmp_spd
        jump = 1
    }
    if(free==1 && hold==1) {
        vsp-= grv_spd/2;
    }
    hold = 1;
} else {hold = 0;}

if(argument2-argument0==1) {
    spr_dir =-1;
    hsp     = max(-max_spd,hsp-acc_spd);
}


// FORCED MOTION
//////////////////

if(argument5==1) {
    repeat(ceil(abs(argument3))) {
        if(place_meeting(x+lengthdir_x(1,grv_dir+(sign(argument3)*90)),y+lengthdir_y(1,grv_dir+(sign(argument3)*90)),parSolid)==0) {
            x+= lengthdir_x(1,grv_dir+(sign(argument3)*90));
            y+= lengthdir_y(1,grv_dir+(sign(argument3)*90));
        } else break;
    }
    repeat(ceil(abs(argument4))) {
        if(place_meeting(x+lengthdir_x(1,grv_dir-90+(sign(argument4)*90)),y+lengthdir_y(1,grv_dir-90+(sign(argument4)*90)),parSolid)==0) {
            x+= lengthdir_x(1,grv_dir-90+(sign(argument4)*90));
            y+= lengthdir_y(1,grv_dir-90+(sign(argument4)*90));
        } else break;
    }
    exit;
}


// HORIZONTAL MOVEMENT
////////////////////////

repeat(round(abs(hsp))) {
    var blk, mov;
    blk = place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90)),y+lengthdir_y(1,grv_dir+(sign(hsp)*90)),parSolid);
    mov = 0;
    if(blk==1) {
        for(a=1;a<=max_slp;a+=1) {
            if(place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))-lengthdir_x(a,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))-lengthdir_y(a,grv_dir),parSolid)==0) {
                x  += lengthdir_x(1,grv_dir+(sign(hsp)*90))-lengthdir_x(a,grv_dir);
                y  += lengthdir_y(1,grv_dir+(sign(hsp)*90))-lengthdir_y(a,grv_dir);
                mov = 1;
                break;
            }
        }
        if(mov==0) {
            hsp = 0;
            break;
        }
    } else {
        for(a=1;a<=max_slp && free==0;a+=1) {
            lis = instance_place_list(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))-lengthdir_x(a-1,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))-lengthdir_y(a-1,grv_dir),parJumpthrough);
            if(lis!=noone) {
                for(b=0;b<ds_list_size(lis);b+=1) {
                    jt = ds_list_find_value(lis,b);
                    if(place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))-lengthdir_x(a,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))-lengthdir_y(a,grv_dir),jt)==0) {
                        x  += lengthdir_x(1,grv_dir+(sign(hsp)*90))-lengthdir_x(a,grv_dir);
                        y  += lengthdir_y(1,grv_dir+(sign(hsp)*90))-lengthdir_y(a,grv_dir);
                        mov = 1;
                        break;
                    }
                }
                if(mov==1){ds_list_destroy(lis);break;}
                ds_list_destroy(lis);
            }
        }
        if(mov==0) {
            for(a=max_slp;a>=1;a-=1) {
                if(place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))+lengthdir_x(a,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))+lengthdir_y(a,grv_dir),parSolid)==0 && (place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))+lengthdir_x(a,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))+lengthdir_y(a,grv_dir),parJumpthrough)==0 && sign(vsp)>-1)) {
                    if(place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))+lengthdir_x(a+1,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))+lengthdir_y(a+1,grv_dir),parSolid)==1 || place_meeting(x+lengthdir_x(1,grv_dir+(sign(hsp)*90))+lengthdir_x(a+1,grv_dir),y+lengthdir_y(1,grv_dir+(sign(hsp)*90))+lengthdir_y(a+1,grv_dir),parJumpthrough)==1) {
                        x  += lengthdir_x(1,grv_dir+(sign(hsp)*90))+lengthdir_x(a,grv_dir);
                        y  += lengthdir_y(1,grv_dir+(sign(hsp)*90))+lengthdir_y(a,grv_dir);
                        mov = 1;
                        break;
                    }
                }
            }
        }
        if(mov==0) {
            x+= lengthdir_x(1,grv_dir+(sign(hsp)*90));
            y+= lengthdir_y(1,grv_dir+(sign(hsp)*90));
        }
    }
}


// VERTICAL MOVEMENT
//////////////////////

var stop;
stop = 0;
repeat(round(abs(vsp))) {
    if(place_meeting(x+lengthdir_x(1,grv_dir-90+(sign(vsp)*90)),y+lengthdir_y(1,grv_dir-90+(sign(vsp)*90)),parSolid)==1) {
        vsp    = 0;
        landed = 1;
        break;
    }
    var jt, lis;
    lis = instance_place_list(x+lengthdir_x(1,grv_dir),y+lengthdir_y(1,grv_dir),parJumpthrough);
    if(lis!=noone) {
        for(a=0;a<ds_list_size(lis) && sign(vsp)==1;a+=1) {
            jt = ds_list_find_value(lis,a);
            if(place_meeting(x,y,jt)==0) {
                vsp    = 0;
                landed = 1;
                break;
            }
        }
        ds_list_destroy(lis);
    }
    if(vsp==0)break;
    x+= lengthdir_x(1,grv_dir-90+(sign(vsp)*90));
    y+= lengthdir_y(1,grv_dir-90+(sign(vsp)*90));
}

free = 1;
if(place_meeting(x+lengthdir_x(1,grv_dir),y+lengthdir_y(1,grv_dir),parSolid)==1) {
    free = 0;
}
var jt, lis;
lis = instance_place_list(x+lengthdir_x(1,grv_dir),y+lengthdir_y(1,grv_dir),parJumpthrough);
if(lis!=noone) {
    for(a=0;a<ds_list_size(lis);a+=1) {
        jt = ds_list_find_value(lis,a);
        if(sign(vsp)>-1 && place_meeting(x,y,jt)==0){free=0;break;}
    }
    ds_list_destroy(lis);
}


// GRAVITY & FRICTION
///////////////////////

if(argument5==0) {
    if(free==1) {
        vsp+= grv_spd;
        if(argument0-argument2==0){hsp=max(0,abs(hsp)-air_frc)*sign(hsp);}
    } else {
        jump = 0;
        if(argument0-argument2==0){hsp=max(0,abs(hsp)-gnd_frc)*sign(hsp);}
    }
}
