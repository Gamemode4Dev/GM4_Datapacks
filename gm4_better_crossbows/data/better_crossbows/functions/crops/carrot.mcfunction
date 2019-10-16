# @s = @e[type=minecraft:arrow,tag=gm4_cb_carrot,nbt={inGround:1b}]
# at @s

#plant carrot
setblock ~ ~ ~ minecraft:carrots

#clear carrot
clear @p[tag=gm4_cb_carrot] carrot 1

#remove tag
tag @p[tag=gm4_cb_carrot] remove gm4_cb_carrot
