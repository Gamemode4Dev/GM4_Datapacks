execute as @e[type=minecart,tag=!smithed.entity] at @s if block ~ ~ ~ ladder on passengers run advancement grant @s only gm4:vertical_rails

schedule function gm4_vertical_rails:main 16t
