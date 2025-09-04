# remove this furniture block
# @s = furniture interaction entity
# at @s
# run from break/destroy

execute positioned ~0.0001 ~0.5001 ~0.0001 run fill ~ ~ ~ ~ ~ ~ air replace #gm4_furniture:furniture_blocks[waterlogged=false]
execute positioned ~0.0001 ~0.5001 ~0.0001 run fill ~ ~ ~ ~ ~ ~ water replace #gm4_furniture:furniture_blocks[waterlogged=true]
execute positioned ~-0.4999 ~0.0001 ~-0.4999 run kill @e[type=item_display,tag=gm4_furniture,dx=0,dy=0,dz=0,limit=3]
kill @s
