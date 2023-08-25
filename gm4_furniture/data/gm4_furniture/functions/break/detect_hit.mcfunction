
advancement revoke @s only gm4_furniture:hit_furniture

execute store success score $creative gm4_furniture_data if entity @s[gamemode=creative]

execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s attack at @s run function gm4_furniture:break/find_main
