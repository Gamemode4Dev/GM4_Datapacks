#run from check_storable in same folder
#@s = as and at item frame in distance=..2 of key that has stripped oak wood below it and is not empty

data modify entity @s Invulnerable set value 1
scoreboard players set @s gm4_sd_amount 1
scoreboard players set @s gm4_sd_upgrade 0
scoreboard players set @s gm4_sd_max 2048

data modify entity @e[type=minecraft:item, tag=gm4_sd_key, limit=1, distance=..0.5] PickupDelay set value 0s
advancement grant @p[distance=..5] only gm4:storage_drawers_create_drawer

tag @s add gm4_sd_drawer