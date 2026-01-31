# scheduled from standard_liquids:util_above

# initialize empty tanks
execute as @a[gamemode=!spectator,level=1..] at @s if block ~ ~-0.4 ~ hopper[enabled=true] positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_empty] run function gm4_standard_liquids:liquid_init/experience

# non-sneaking deposits points
execute as @a[gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] at @s if block ~ ~-0.4 ~ hopper[enabled=true] positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if score @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_experience] gm4_lt_value matches ..5344 run function gm4_standard_liquids:util/experience/deposit_points

# sneaking deposits levels
scoreboard players reset @a[gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] gm4_lt_value
scoreboard players reset @a[gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] gm4_lt_util
execute as @a[gamemode=!spectator,predicate=gm4_standard_liquids:sneaking] at @s if block ~ ~-0.4 ~ hopper[enabled=true] positioned ~ ~-0.4 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if score @e[type=marker,tag=gm4_liquid_tank,limit=1,distance=..0.5,tag=gm4_lt_experience] gm4_lt_value matches ..5344 run function gm4_standard_liquids:util/experience/deposit_levels


scoreboard players set $schedule_deposit_exp gm4_lt_util 2
schedule function gm4_standard_liquids:util/experience/scheduled_deposit 1t
