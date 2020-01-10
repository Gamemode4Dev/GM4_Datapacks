#ran at all landmines every tick
#@s = armed landmine
execute positioned ~-1 ~ ~-1 if entity @a[dy=3,dx=1.1,dz=1.1,gamemode=!creative,gamemode=!spectator] run function gm4_tnt_landmines:blowup/type_check
execute if block ~ ~ ~ air run function gm4_tnt_landmines:blowup/type_check
