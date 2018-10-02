#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = tnt_landmines gm4_clockTick run function tnt_landmines:main
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed] at @s positioned ~ ~1.3 ~ if entity @a[distance=..1.5,gamemode=!creative,gamemode=!spectator] run function tnt_landmines:blowup
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed] at @s if block ~ ~ ~ air run function tnt_landmines:blowup
