# Run ski-related functions
execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:ski_effects/skis_equipped

# Adds jump boost effects when holding poles
execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] at @s run function gm4_mountaineering:pole_effects/poles_equipped

# Clear any crampon effects when crampons are removed
execute as @a[gamemode=!spectator,predicate=!gm4_mountaineering:wearing_crampons,tag=gm4_mountaineering_using_crampons] at @s run function gm4_mountaineering:climbing_effects/clear_crampon_effects

schedule function gm4_mountaineering:main 16t
