#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = tnt_landmines gm4_clock_tick run function tnt_landmines:main
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,tag=!gm4_no_damage] at @s positioned ~-1 ~ ~-1 if entity @a[dy=3,dx=1.1,dz=1.1,gamemode=!creative,gamemode=!spectator] run function tnt_landmines:blowup
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,tag=!gm4_no_damage] at @s if block ~ ~ ~ air run function tnt_landmines:blowup
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,tag=gm4_no_damage] at @s positioned ~-1 ~ ~-1 if entity @a[dy=3,dx=1.1,dz=1.1,gamemode=!creative,gamemode=!spectator] run function tnt_landmines:safe_blowup
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed,tag=gm4_no_damage] at @s if block ~ ~ ~ air run function tnt_landmines:safe_blowup
