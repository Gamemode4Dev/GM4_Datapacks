# Remove all ski-related effects
# @s = player that removed skis
# at @s
# run from player_main

tag @s remove gm4_mountaineering_using_skis
tag @s remove gm4_mountaineering_skiing
execute if entity @s[tag=gm4_mountaineering_ski_speed] run function gm4_mountaineering:ski_effects/flat_ski_speed/remove_flat_ski_speed
execute if entity @s[tag=gm4_mountaineering_skiing_downhill] run function gm4_mountaineering:ski_effects/downhill_ski_speed/remove_downhill_ski_speed
execute if entity @s[tag=gm4_mountaineering_skiing_steep_downhill] run function gm4_mountaineering:ski_effects/steep_downhill_ski_speed/remove_steep_downhill_ski_speed
execute if entity @s[tag=gm4_mountaineering_ski_slowness] run function gm4_mountaineering:ski_effects/ski_off_snow_slowness/remove_off_snow_slowness
