#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=40,dy=296,dz=40] minecraft:slowness 11 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=40,dy=296,dz=40] minecraft:mining_fatigue 11 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=40,dy=296,dz=40] minecraft:weakness 11 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=40,dy=296,dz=40] minecraft:slow_falling 11 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=40,dy=296,dz=40] minecraft:glowing 11 0
execute if score @s gm4_sg_secondary matches 1 run effect give @a[dx=40,dy=296,dz=40] minecraft:slowness 11 1
execute if score @s gm4_sg_secondary matches 3 run effect give @a[dx=40,dy=296,dz=40] minecraft:mining_fatigue 11 1
execute if score @s gm4_sg_secondary matches 5 run effect give @a[dx=40,dy=296,dz=40] minecraft:weakness 11 1
execute if score @s gm4_sg_secondary matches 8 run effect give @a[dx=40,dy=296,dz=40] minecraft:slow_falling 11 1
execute if score @s gm4_sg_secondary matches 10 run effect give @a[dx=40,dy=296,dz=40] minecraft:poison 11 0
