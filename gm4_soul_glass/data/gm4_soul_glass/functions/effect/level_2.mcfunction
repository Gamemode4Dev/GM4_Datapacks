#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=60,dy=316,dz=60] minecraft:slowness 13 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=60,dy=316,dz=60] minecraft:mining_fatigue 13 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=60,dy=316,dz=60] minecraft:weakness 13 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=60,dy=316,dz=60] minecraft:slow_falling 13 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=60,dy=316,dz=60] minecraft:glowing 13 0
execute if score @s gm4_sg_secondary matches 1 run effect give @a[dx=60,dy=316,dz=60] minecraft:slowness 13 1
execute if score @s gm4_sg_secondary matches 3 run effect give @a[dx=60,dy=316,dz=60] minecraft:mining_fatigue 13 1
execute if score @s gm4_sg_secondary matches 5 run effect give @a[dx=60,dy=316,dz=60] minecraft:weakness 13 1
execute if score @s gm4_sg_secondary matches 8 run effect give @a[dx=60,dy=316,dz=60] minecraft:slow_falling 13 1
execute if score @s gm4_sg_secondary matches 10 run effect give @a[dx=60,dy=316,dz=60] minecraft:poison 13 0
