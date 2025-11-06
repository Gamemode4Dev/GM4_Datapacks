scoreboard players operation $size gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute as @e[type=pig,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_lavish_livestock:modify_baby

kill @s
