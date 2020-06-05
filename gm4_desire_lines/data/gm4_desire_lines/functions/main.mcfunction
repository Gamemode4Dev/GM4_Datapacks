scoreboard players add desire_lines gm4_dl_random 27
execute if score desire_lines gm4_dl_random matches 100.. run scoreboard players remove desire_lines gm4_dl_random 100

execute as @a[gamemode=!spectator,gamemode=!eative] at @s run function gm4_desire_lines:player

schedule function gm4_desire_lines:main 1t
