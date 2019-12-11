scoreboard objectives add gm4_stored_xp dummy
scoreboard objectives add gm4_xp_sneaking minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_xp_calc dummy

execute unless score xp_storage gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"XP Storage"}
scoreboard players set xp_storage gm4_modules 1

schedule function gm4_xp_storage:main 1t
schedule function gm4_xp_storage:tick 1t

#$moduleUpdateList
