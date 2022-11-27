# Run all ski-related functions
# @s = player wearing skis
# at @s
# run from player_main

tag @s add gm4_mountaineering_using_skis

# Adds tags for whether the player is skiing normally or skiing on a non-snowy block
function gm4_mountaineering:ski_effects/check_snowy_block

# Adds particles at the player's feet when skiing on a snowy bock and without air below
execute if entity @s[tag=gm4_mountaineering_skiing] unless block ~ ~-2 ~ minecraft:air run particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0.001 50 normal

# Records the player's y-velocity in a scoreboard
function gm4_mountaineering:get_velocity

# Adds speed effects for skiing on a flat surface
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_ski_speed] run function gm4_mountaineering:ski_effects/flat_ski_speed/add_flat_ski_speed
execute if entity @s[tag=!gm4_mountaineering_skiing,tag=gm4_mountaineering_ski_speed] run function gm4_mountaineering:ski_effects/flat_ski_speed/remove_flat_ski_speed

# Adds increased speed effects for skiing on a downhill surface
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_downhill,scores={gm4_mountaineering_vy=..-2}] run function gm4_mountaineering:ski_effects/downhill_ski_speed/add_downhill_ski_speed
execute if entity @s[tag=gm4_mountaineering_skiing_downhill] run function gm4_mountaineering:ski_effects/downhill_ski_speed/check_downhill_ski_speed

# Adds greater increased speed effects for skiing on a steep downhill surface, with a lower vertical velocity threshold if poles are used
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_steep_downhill,scores={gm4_mountaineering_vy=..-7},predicate=!gm4_mountaineering:holding_poles] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/add_steep_downhill_ski_speed
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_steep_downhill,scores={gm4_mountaineering_vy=..-5},predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/add_steep_downhill_ski_speed
execute if entity @s[tag=gm4_mountaineering_skiing_steep_downhill] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/check_steep_downhill_ski_speed
