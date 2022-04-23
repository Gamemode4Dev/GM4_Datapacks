# scheduled from standard_liquids:util_above

execute as @a[gamemode=!spectator,level=1..] at @s if block ~ ~-0.4 ~ hopper[enabled=true] positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_empty] run function gm4_standard_liquids:liquid_init/experience
execute as @a[gamemode=!spectator] at @s if block ~ ~-0.4 ~ hopper[enabled=true] positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if score @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_experience] gm4_lt_value matches ..1394 run function gm4_standard_liquids:util/deposit_experience
scoreboard players set $schedule_deposit_exp gm4_lt_util 2

schedule function gm4_standard_liquids:util/scheduled_deposit_exp 1t
