# @s = @e[type=minecraft:arrow,tag=gm4_cb_potato,nbt={inGround:1b}]
# at @s

#plant carrot
setblock ~ ~ ~ minecraft:potatoes

#clear carrot
clear @p[tag=gm4_cb_potato] potato 1

#remove tag
tag @p[tag=gm4_cb_potato] remove gm4_cb_potato
