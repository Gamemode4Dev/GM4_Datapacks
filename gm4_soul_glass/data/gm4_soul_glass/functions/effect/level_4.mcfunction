#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=100,dy=356,dz=100] minecraft:slowness 17 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=100,dy=356,dz=100] minecraft:mining_fatigue 17 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=100,dy=356,dz=100] minecraft:weakness 17 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=100,dy=356,dz=100] minecraft:slow_falling 17 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=100,dy=356,dz=100] minecraft:glowing 17 0
execute if score @s gm4_sg_secondary matches 1 run effect give @a[dx=100,dy=356,dz=100] minecraft:slowness 17 1
execute if score @s gm4_sg_secondary matches 3 run effect give @a[dx=100,dy=356,dz=100] minecraft:mining_fatigue 17 1
execute if score @s gm4_sg_secondary matches 5 run effect give @a[dx=100,dy=356,dz=100] minecraft:weakness 17 1
execute if score @s gm4_sg_secondary matches 8 run effect give @a[dx=100,dy=356,dz=100] minecraft:slow_falling 17 1
execute if score @s gm4_sg_secondary matches 10 run effect give @a[dx=100,dy=356,dz=100] minecraft:hunger 17 0
