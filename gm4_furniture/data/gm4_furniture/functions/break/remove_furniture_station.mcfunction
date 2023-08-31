# remove the flower pot and wandering trader when a furniture station is destroyed
# furniture station interaction entity
# at @s
# run from break/destroy

setblock ~ ~2 ~ air
execute as @e[type=wandering_trader,tag=gm4_furniture,distance=..4] if score @s gm4_furniture_id = $check_id gm4_furniture_id run tp @s ~ -100000 ~
execute positioned ~-0.4999 ~0.0001 ~-0.4999 run kill @e[type=item_display,tag=gm4_furniture.tool,dx=0,dy=0,dz=0]
