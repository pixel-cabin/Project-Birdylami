///time_phase_init()
if global.ignore_time_phase = "false" {
if ((global.hour_time > 17) || (global.hour_time < 7)) // above 17 or below 7
if ((global.hour_time != 7) && (global.hour_time != 17))
{ global.time_phase = "night" }

if ((global.hour_time = 7) || (global.hour_time = 17))
{ global.time_phase = "transition" }

if ((global.hour_time > 7) && (global.hour_time < 17)) // between 7 and 17
if ((global.hour_time != 7) && (global.hour_time != 17))
{ global.time_phase = "day" }
}
