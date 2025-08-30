# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from main

# pre-mark mob as processed if it spawned in the air (from a spawner), these do not get modified
# mobs in the modify_in_air list are ignored here
execute if block ~ ~-0.01 ~ #gm4:no_collision run tag @s[type=!#gm4_survival_refightalized:modify_in_air] add gm4_sr_processed

# if the mob is riding another mob *do* modify them
scoreboard players set $mounted gm4_sr_data 0
execute if entity @s[tag=gm4_sr_processed] on vehicle run scoreboard players set $mounted gm4_sr_data 1
execute if score $mounted gm4_sr_data matches 1 run tag @s remove gm4_sr_processed

# initiate unless mob is pre-marked
execute unless entity @s[tag=gm4_sr_processed] if dimension minecraft:overworld run function gm4_survival_refightalized:mob/init/calc_difficulty_overworld
execute unless entity @s[tag=gm4_sr_processed] unless dimension minecraft:overworld run function gm4_survival_refightalized:mob/init/calc_difficulty_else
