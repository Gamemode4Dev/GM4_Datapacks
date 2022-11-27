# Submain function to limit `as @a at @s` in main
# @s = player not in spectator
# at @s
# run from main

# Run ski-related functions
execute at @s if entity @s[predicate=gm4_mountaineering:wearing_skis] run function gm4_mountaineering:ski_effects/skis_equipped

# Clear ski-related functions when skis are removed
execute at @s if entity @s[predicate=!gm4_mountaineering:wearing_skis,tag=gm4_mountaineering_using_skis] run function gm4_mountaineering:ski_effects/skis_removed

# Adds jump boost effects when holding poles
execute at @s if entity @s[predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:pole_effects/poles_equipped

# Initiate crampons when they are first equipped
execute at @s if entity @s[tag=!gm4_mountaineering_using_crampons,predicate=gm4_mountaineering:wearing_crampons] run function gm4_mountaineering:climbing_effects/init_crampons

# Clear any crampon effects when crampons are removed
execute at @s if entity @s[predicate=!gm4_mountaineering:wearing_crampons,tag=gm4_mountaineering_using_crampons] run function gm4_mountaineering:climbing_effects/clear_crampon_effects

# Apply damage to any climbing shulkers
execute as @e[type=minecraft:shulker,tag=gm4_mountaineering_climb_assist] at @s run function gm4_mountaineering:climbing_effects/damage_shulkers
