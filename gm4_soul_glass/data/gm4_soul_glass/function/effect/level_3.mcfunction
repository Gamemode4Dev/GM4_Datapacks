#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=80,dy=336,dz=80,gamemode=!spectator] minecraft:slowness 15 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=80,dy=336,dz=80,gamemode=!spectator] minecraft:mining_fatigue 15 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=80,dy=336,dz=80,gamemode=!spectator] minecraft:weakness 15 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=80,dy=336,dz=80,gamemode=!spectator] minecraft:slow_falling 15 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=80,dy=336,dz=80,gamemode=!spectator] minecraft:glowing 15 0
