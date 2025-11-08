# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from main

# /!\ This function only runs if Survival Refightalized is not installed

# pre-mark mob as processed if it spawned in the air (from a spawner), these do not get modified
# mobs in the modify_in_air list are ignored here
execute if block ~ ~-0.01 ~ #gm4:no_collision run tag @s[type=!#gm4_monsters_unbound:modify_in_air] add gm4_sr_from_spawner

# if the mob is riding another mob *do* modify them
scoreboard players set $mounted gm4_mu_data 0
execute if entity @s[tag=gm4_sr_from_spawner] on vehicle run scoreboard players set $mounted gm4_mu_data 1
execute if score $mounted gm4_mu_data matches 1 run tag @s remove gm4_sr_from_spawner

function gm4_monsters_unbound:mob/init/initialize
