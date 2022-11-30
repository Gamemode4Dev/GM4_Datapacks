# Running on a faster clock to enable smoother climbing and for poles fall damage reduction to work

execute as @a[gamemode=!spectator] at @s run function gm4_mountaineering:player_fast_main

schedule function gm4_mountaineering:fast_main 4t
