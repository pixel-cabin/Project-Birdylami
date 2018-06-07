
#define hrt_marker_set
// Sets the marker with a given id to a specific time
// If the time argument is left out, the marker is set to now
// An additional argument can be provided indicating whether or not
//  the time argument is relative to the current time (default: false)

{
    return __hrt_marker_set(argument0, argument1, argument2);
}
