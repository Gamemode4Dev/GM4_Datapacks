# Submain function to limit `as @a` calls in main
# run from main

# Run ski-related functions
execute at @s[predicate=gm4_mountaineering:wearing_skis] run function gm4_mountaineering:ski_effects/skis_equipped

# Clear ski-related functions when skis are removed
execute at @s[predicate=!gm4_mountaineering:wearing_skis,tag=gm4_mountaineering_using_skis] run function gm4_mountaineering:ski_effects/skis_removed

# Adds jump boost effects when holding poles
execute at @s[predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:pole_effects/poles_equipped

# Initiate crampons when they are first equipped with a tag
tag @s[tag=!gm4_mountaineering_using_crampons,predicate=gm4_mountaineering:wearing_crampons] add gm4_mountaineering_using_crampons

# Clear crampon tag when crampons are removed
tag @s[predicate=!gm4_mountaineering:wearing_crampons,tag=gm4_mountaineering_using_crampons] remove gm4_mountaineering_using_crampons

# Apply damage to any climbing shulkers
execute as @e[type=minecraft:shulker,tag=gm4_mountaineering_climb_assist] at @s run function gm4_mountaineering:climbing_effects/damage_shulkers
