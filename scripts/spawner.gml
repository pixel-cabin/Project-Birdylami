///spawner(x,y,object,spawnlimit)

if object_exists(argument2)
if is_real(argument3)
if instance_exists(view_object[0])
if instance_number(argument2) <= real(argument3)
if hasspawned = false
if distance_to_point(view_xview+view_wview/2,view_yview+view_hview/2) <= 400
{
    hasspawned = true
    
    with(instance_create(real(argument0),real(argument1),argument2))
        {
        if x > other.x
            {
            image_xscale = -1
            }
        if x < other.x
            {
            image_yscale = 1
            }
        }
}

if distance_to_point(view_xview+view_wview/2,view_yview+view_hview/2) > 400
    {
    hasspawned = false
    }
