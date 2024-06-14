# Submain function to limit `as @a` calls in main
# @s = player not in spectator
# at @s
# run from main

# Run ski-related functions
execute if entity @s[predicate=gm4_mountaineering:wearing_skis] run function gm4_mountaineering:ski_effects/skis_equipped

# Clear ski-related functions when skis are removed
execute if entity @s[predicate=!gm4_mountaineering:wearing_skis,tag=gm4_mountaineering_using_skis] run function gm4_mountaineering:ski_effects/skis_removed

# Adds jump boost effects when holding poles
execute if entity @s[predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:pole_effects/poles_equipped
