execute at @e[type=minecart,tag=!smithed.entity] if block ~ ~ ~ ladder as @a[distance=..0.37,gamemode=!spectator] run advancement grant @s only gm4:vertical_rails

schedule function gm4_vertical_rails:main 16t
