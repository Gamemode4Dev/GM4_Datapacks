# Checks if the player is wearing skis, and if yes, run player_can_ski to enable skiing effects

execute as @a[gamemode=!spectator,gamemode=!adventure,predicate=gm4_skis:wearing_skis] run function gm4_skis:ski_effects/skis_equipped

schedule function gm4_skis:main 16t
