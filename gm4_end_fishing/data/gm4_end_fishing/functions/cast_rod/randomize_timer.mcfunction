#@s = fishing bait armor stand
#run from cast_rod/summon_bait and go_fish/bobber_animation

scoreboard players operation seed gm4_ef_data *= mult gm4_ef_data
scoreboard players operation seed gm4_ef_data += incr gm4_ef_data
scoreboard players operation result gm4_ef_data = seed gm4_ef_data
scoreboard players operation result gm4_ef_data /= #57 gm4_ef_data
scoreboard players operation result gm4_ef_data %= #57 gm4_ef_data
scoreboard players add result gm4_ef_data 19
scoreboard players operation decrease gm4_ef_data = @s gm4_ef_lure
scoreboard players operation decrease gm4_ef_data *= #6 gm4_ef_data
scoreboard players operation result gm4_ef_data -= decrease gm4_ef_data
scoreboard players operation @s gm4_ef_timer = result gm4_ef_data
execute if score @s gm4_ef_timer matches ..3 run scoreboard players set @s gm4_ef_timer 4
