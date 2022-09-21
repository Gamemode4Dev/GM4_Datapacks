# Run functions to provide relevant effects when a piece of mountaineering gear is worn

execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:ski_effects/check_snowy_block

execute as @a[gamemode=!spectator,tag=gm4_mountaineering_skiing] at @s run function gm4_mountaineering:ski_effects/skis_equipped
#execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] at @s run function gm4_mountaineering:ski_effects/poles_equipped
#execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:wearing_crampons] at @s run function gm4_mountaineering:ski_effects/crampons_equipped

schedule function gm4_mountaineering:main 16t
