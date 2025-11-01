# scheduled from standard_liquids:util_below

# non-sneaking retrieves points
execute as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_lt_experience] at @s if block ~ ~ ~ hopper[enabled=true] positioned ~ ~-2.5 ~ if entity @a[distance=..0.5,gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] if score @s gm4_lt_value matches 1.. run function gm4_standard_liquids:util/experience/withdraw_points

# sneaking retrieves levels
scoreboard players reset @a[gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] gm4_lt_value
scoreboard players reset @a[gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] gm4_lt_util
execute as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_lt_experience] at @s if block ~ ~ ~ hopper[enabled=true] positioned ~ ~-2.5 ~ if score @s gm4_lt_value matches 1.. as @a[distance=..0.5,gamemode=!spectator,predicate=gm4_standard_liquids:sneaking,limit=1] positioned ~ ~2.5 ~ run function gm4_standard_liquids:util/experience/withdraw_levels

scoreboard players set $schedule_withdraw_exp gm4_lt_util 2
schedule function gm4_standard_liquids:util/experience/scheduled_withdraw 1t
