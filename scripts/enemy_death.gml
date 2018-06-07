///enemy_death(deathObject,sound,score,exp)
global.scoreboard += argument2
global.add_exp = 1
global.stamina_exp += argument3
instance_change(argument0,true)
audio_play_sound(argument1,1,false)

