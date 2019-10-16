# @s = @e[type=minecraft:arrow,tag=gm4_cb_wheat,nbt={inGround:1b}]
# at @s

#plant carrot
setblock ~ ~ ~ minecraft:wheat

#clear carrot
clear @p[tag=gm4_cb_wheat] wheat_seeds 1

#remove tag
tag @p[tag=gm4_cb_wheat] remove gm4_cb_wheat
