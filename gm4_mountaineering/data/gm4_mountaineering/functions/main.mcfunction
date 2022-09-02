# Run functions to provide relevant effects when a piece of mountaineering gear is worn

execute as @a[gamemode=!spectator,gamemode=!adventure,predicate=gm4_mountaineering:wearing_skis] run function gm4_mountaineering:ski_effects/skis_equipped

schedule function gm4_mountaineering:main 16t
