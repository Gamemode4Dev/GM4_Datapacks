#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=80,dy=336,dz=80] minecraft:slowness 15 1
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=80,dy=336,dz=80] minecraft:mining_fatigue 15 1
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=80,dy=336,dz=80] minecraft:weakness 15 1
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=80,dy=336,dz=80] minecraft:slow_falling 15 1
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=80,dy=336,dz=80] minecraft:glowing 15 1
