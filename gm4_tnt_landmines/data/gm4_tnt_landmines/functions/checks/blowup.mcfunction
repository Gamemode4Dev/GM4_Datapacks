# @s = armed landmine
# run from tick

execute positioned ~-1 ~ ~-1 if entity @a[dy=3,dx=1.1,dz=1.1,gamemode=!creative,gamemode=!spectator] at @s run function gm4_tnt_landmines:blowup/type_check
execute if block ~ ~ ~ air run function gm4_tnt_landmines:blowup/type_check
