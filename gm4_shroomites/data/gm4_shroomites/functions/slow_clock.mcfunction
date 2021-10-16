# handle sporing shrooms
scoreboard players set $global_shroom_count gm4_shroom_data 0
execute as @e[type=marker,tag=gm4_shroomite_shroom] at @s run function gm4_shroomites:shroom/check_structure

# handle mooshrooms placing shrooms
execute as @e[type=mooshroom] at @s run function gm4_shroomites:mooshroom/process

# grant advancement if shroomite cap has been reached
execute if score $global_shroom_count gm4_shroom_data >= #global_shroom_cap gm4_shroom_data run advancement grant @a only gm4:shroomites

# reschedule
schedule function gm4_shroomites:slow_clock 128t
