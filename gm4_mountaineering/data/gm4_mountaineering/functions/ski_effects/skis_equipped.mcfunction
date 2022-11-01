# run all ski-related functions
# @s = player wearing skis
# at @s
# run from main

# Adds tags for whether the player is skiing normally or skiing on a non-snowy block
execute run function gm4_mountaineering:ski_effects/check_snowy_block

# Records the player's y-velocity in a scoreboard
execute run function gm4_mountaineering:get_velocity

# Adds speed effects for skiing on a flat surface
execute if entity @s[tag=gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/flat_ski_speed/add_flat_ski_speed
execute if entity @s[tag=!gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/flat_ski_speed/remove_flat_ski_speed

# Adds slowness effects for skiing on a non-snowy block
execute if entity @s[tag=gm4_mountaineering_skiing_off_snow] run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/add_off_snow_slowness
execute if entity @s[tag=!gm4_mountaineering_skiing_off_snow] at @s run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/remove_off_snow_slowness

# Adds increased speed effects for skiing on a downhill surface
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_downhill,scores={gm4_mountaineering_vy=..-2}] run function gm4_mountaineering:ski_effects/downhill_ski_speed/add_downhill_ski_speed
execute if entity @s[gamemode=!spectator,tag=gm4_mountaineering_skiing_downhill] run function gm4_mountaineering:ski_effects/downhill_ski_speed/check_downhill_ski_speed

# Adds greater increased speed effects for skiing on a steep downhill surface, with a lower vertical velocity threshold if poles are used
execute if entity @s[tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_steep_downhill,scores={gm4_mountaineering_vy=..-7},predicate=!gm4_mountaineering:holding_poles] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/add_steep_downhill_ski_speed
execute if entity @s[gamemode=!spectator,tag=gm4_mountaineering_skiing,tag=!gm4_mountaineering_skiing_steep_downhill,scores={gm4_mountaineering_vy=..-5},predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/add_steep_downhill_ski_speed
execute if entity @s[gamemode=!spectator,tag=gm4_mountaineering_skiing_steep_downhill] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/check_steep_downhill_ski_speed

