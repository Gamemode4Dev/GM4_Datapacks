# remove the flower pot and wandering trader when a furniture station is destroyed
# furniture station interaction entity
# at @s
# run from break/destroy

setblock ~ ~2 ~ air
execute as @e[type=wandering_trader,tag=gm4_furniture,distance=..4] if score @s gm4_furniture_id = $check_id gm4_furniture_id run tp @s ~ -100000 ~
