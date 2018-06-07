/*
**  Usage:
**      instance_place_list(x,y,obj)
**
**  Arguments:
**      x,y         placement of current instance for collision check
**      obj         object to check for collision
**
**  Returns:
**      a ds_list id, or keyword noone if no instances are found
**
**  GMLscripts.com
*/
{
    var x1,y1,obj,dsid,this,that,i;
    x1 = argument0;
    y1 = argument1;
    obj = argument2;
    dsid = ds_list_create();
    this = id;
    with (obj) {
        that = id;
        with (this) {
            i = instance_place(x1,y1,that);
            if (i != noone) ds_list_add(dsid,i);
        }
    }
    if (ds_list_empty(dsid)) {
        ds_list_destroy(dsid);
        dsid = noone;
    }
    return dsid;
}
