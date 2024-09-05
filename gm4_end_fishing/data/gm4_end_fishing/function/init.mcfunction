scoreboard objectives add gm4_cast_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add gm4_ef_timer dummy
scoreboard objectives add gm4_ef_id dummy
scoreboard objectives add gm4_ef_lure dummy
scoreboard objectives add gm4_ef_data dummy
scoreboard objectives add gm4_ef_up_bait dummy
scoreboard objectives add gm4_ef_fall dummy
scoreboard objectives add gm4_ef_sneak minecraft.custom:minecraft.sneak_time
# scoreboard objectives add gm4_ef_jump minecraft.custom:minecraft.jump

scoreboard players set #100 gm4_ef_data 100
scoreboard players set #6 gm4_ef_data 6
scoreboard players set #57 gm4_ef_data 57
scoreboard players set #4 gm4_ef_data 4
scoreboard players set #64 gm4_ef_data 64
scoreboard players set #10000 gm4_ef_data 10000

execute unless score end_fishing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"End Fishing"}
execute unless score end_fishing gm4_earliest_version < end_fishing gm4_modules run scoreboard players operation end_fishing gm4_earliest_version = end_fishing gm4_modules
scoreboard players set end_fishing gm4_modules 1

schedule function gm4_end_fishing:main 1t
schedule function gm4_end_fishing:tick 1t

#$moduleUpdateList
