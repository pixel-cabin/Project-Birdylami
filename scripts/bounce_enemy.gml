///bounce_enemy()

enemy = instance_position(x,y,par_enemy)
if !instance_exists(enemy) {exit}

if distance_to_object(enemy) > 20
{
collide = 0
}

if collide = 1 {exit}

if place_meeting(x,y,enemy)
if distance_to_object(enemy) <= 20
{
image_index = 1
audio_play_sound(snd_bumper,1,false)
audio_sound_pitch(snd_bumper,random_range(0.6,0.9))
{
    if (place_meeting(bbox_left-1,y,enemy)) && hsp != 0 { hsp += 1 }  
    if (place_meeting(bbox_right+1,y,enemy)) && hsp != 0 { hsp += -1 }  
    if (place_meeting(x,bbox_top-1,enemy)) && vsp != 0 { vsp += 1 }  
    if (place_meeting(x,bbox_bottom+1,enemy)) && vsp != 0 { vsp += -2 }  
}
collide = 1
}

