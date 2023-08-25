
advancement revoke @s only gm4_furniture:hit_furniture_station

execute as @e[type=wandering_trader,tag=gm4_furniture.furniture_station,distance=..8,nbt={HurtTime:10s}] at @s run say hit
