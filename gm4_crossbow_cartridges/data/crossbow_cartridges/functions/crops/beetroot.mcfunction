# @s = @e[type=minecraft:arrow,tag=gm4_cb_beet,nbt={inGround:1b}]
# at @s

#plant carrot
setblock ~ ~ ~ minecraft:beetroots

#clear carrot
clear @p[tag=gm4_cb_beet] beetroot_seeds 1

#remove tag
tag @p[tag=gm4_cb_beet] remove gm4_cb_beet
