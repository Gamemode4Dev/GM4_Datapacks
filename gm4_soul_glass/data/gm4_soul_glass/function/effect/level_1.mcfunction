#@s = soul glass AEC with level 1 beacon below it
#run from effects/check

execute if score @s gm4_sg_primary matches 1 run effect give @a[dx=40,dy=296,dz=40,gamemode=!spectator] minecraft:slowness 11 0
execute if score @s gm4_sg_primary matches 3 run effect give @a[dx=40,dy=296,dz=40,gamemode=!spectator] minecraft:mining_fatigue 11 0
execute if score @s gm4_sg_primary matches 5 run effect give @a[dx=40,dy=296,dz=40,gamemode=!spectator] minecraft:weakness 11 0
execute if score @s gm4_sg_primary matches 8 run effect give @a[dx=40,dy=296,dz=40,gamemode=!spectator] minecraft:slow_falling 11 0
execute if score @s gm4_sg_primary matches 11 run effect give @a[dx=40,dy=296,dz=40,gamemode=!spectator] minecraft:glowing 11 0
