# Checks if the player is wearing skis, and if yes, run player_can_ski to enable skiing effects

execute as @a[gamemode=!spectator,gamemode=!adventure,predicate=gm4_skis:wearing_skis] at @s run function gm4_skis:player_can_ski

schedule function gm4_skis:main 16t
