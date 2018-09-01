scoreboard players add desire_lines gm4_random 27
execute if score desire_lines gm4_random matches 100.. run scoreboard players remove desire_lines gm4_random 100

execute as @a[gamemode=!spectator] at @s run function desire_lines:player
