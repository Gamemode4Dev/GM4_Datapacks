execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:player_main

# Initiate crampons when they are first equipped with a tag
tag @a[tag=!gm4_mountaineering_using_crampons,predicate=gm4_mountaineering:wearing_crampons] add gm4_mountaineering_using_crampons

# Clear crampon tag when crampons are removed
tag @a[predicate=!gm4_mountaineering:wearing_crampons,tag=gm4_mountaineering_using_crampons] remove gm4_mountaineering_using_crampons

# Reset the jump counter for use in the poles jump boost cooldown
scoreboard players reset @a gm4_mountaineering_jump_counter

# Apply damage to any climbing shulkers
execute as @e[type=minecraft:shulker,tag=gm4_mountaineering_climb_assist] at @s run function gm4_mountaineering:climbing_effects/damage_shulkers

schedule function gm4_mountaineering:main 16t
