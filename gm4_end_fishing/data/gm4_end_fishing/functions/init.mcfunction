scoreboard objectives add gm4_cast_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add gm4_ef_timer dummy
scoreboard objectives add gm4_ef_id dummy
scoreboard objectives add gm4_ef_lure dummy
scoreboard objectives add gm4_ef_data dummy
scoreboard objectives add gm4_ef_up_bait dummy
execute unless score seed gm4_ef_data matches 0.. run scoreboard players set seed gm4_ef_data 731031
scoreboard players set mult gm4_ef_data 1664525
scoreboard players set incr gm4_ef_data 1013904223
scoreboard players set #100 gm4_ef_data 100
scoreboard players set #6 gm4_ef_data 6
scoreboard players set #0 gm4_ef_data 0
scoreboard players set #57 gm4_ef_data 57
scoreboard players set #4 gm4_ef_data 4

execute unless score end_fishing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"End Fishing"}
scoreboard players set end_fishing gm4_modules 1

schedule function gm4_end_fishing:main 1t
schedule function gm4_end_fishing:tick 1t
function gm4_end_fishing:t
#$moduleUpdateList
