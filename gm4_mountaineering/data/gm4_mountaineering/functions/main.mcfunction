# Run functions to provide relevant effects when a piece of mountaineering gear is worn

tag @s remove gm4_mountaineering_skiing
execute at @a[gamemode=!spectator] run function gm4_mountaineering:ski_effects/check_snowy_block

execute at @a[gamemode=!spectator,tag=gm4_mountaineering_skiing] run function gm4_mountaineering:ski_effects/skis_equipped
execute at @a[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] run function gm4_mountaineering:ski_effects/poles_equipped
execute at @a[gamemode=!spectator,predicate=gm4_mountaineering:wearing_crampons] run function gm4_mountaineering:ski_effects/crampons_equipped


schedule function gm4_mountaineering:main 16t
