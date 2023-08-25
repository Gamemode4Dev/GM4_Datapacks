
setblock ~ ~2 ~ air
execute as @e[type=wandering_trader,tag=gm4_furniture,distance=..4] if score @s gm4_furniture_id = $check_id gm4_furniture_id run tp @s ~ -100000 ~
