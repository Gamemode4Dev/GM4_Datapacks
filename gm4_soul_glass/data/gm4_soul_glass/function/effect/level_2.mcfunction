# @s = gm4_soul_glass marker with level 2 beacon below it
# run from effect/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=60,dy=316,dz=60,gamemode=!spectator] minecraft:slowness 13 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=60,dy=316,dz=60,gamemode=!spectator] minecraft:mining_fatigue 13 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=60,dy=316,dz=60,gamemode=!spectator] minecraft:weakness 13 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=60,dy=316,dz=60,gamemode=!spectator] minecraft:slow_falling 13 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=60,dy=316,dz=60,gamemode=!spectator] minecraft:glowing 13 0
