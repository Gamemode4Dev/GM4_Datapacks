# remove the villager when a furniture station is destroyed
# furniture station interaction entity
# at @s
# run from break/destroy

setblock ~ ~1 ~ air
fill ~ ~2 ~ ~ ~2 ~ air replace light[level=0]
execute as @e[type=villager,tag=gm4_furniture,distance=..4] if score @s gm4_furniture_id = $check_id gm4_furniture_id run tp @s ~ -100000 ~
execute positioned ~-0.4999 ~0.0001 ~-0.4999 run kill @e[type=item_display,tag=gm4_furniture.tool,dx=0,dy=0,dz=0]
