///push_object(object,acceleration,max_speed //OBJECT NEEDS HSP VARIABLE)

//argument0 = object
//argument1 = acceleration
//argument2 = max_speed

movement = 0

if global.facing = 0 { movement = 1 }
if global.facing = 180 { movement = -1 }
obj = argument0
acc = argument1
maxspd = argument2
pmeeting = place_meeting(x+hsp+(movement*2),y,obj_ball)
instpos = instance_position(x+hsp+(movement*2),y,obj_ball)

if instance_exists(obj)
if pmeeting {
with(instpos) {
    
    if place_meeting(x-17,y,other)
    if keyboard_check(global.saved_rightkey)  // if pusher's hspeed is greater than zero
    if hsp != other.maxspd  { //if speed of object is not equal to max speed
        other.hsp += other.acc
        hsp += other.acc
        image_angle += hsp
          }
    
    if place_meeting(x+17,y,other)    
    if keyboard_check(global.saved_leftkey)   // if pusher's hspeed is less than zero
    if hsp != -(other.maxspd)  { //if speed of object is not equal to max speed
        other.hsp -= other.acc
        hsp -= other.acc
        image_angle -= hsp
          }
        
    }
}
