# @s = @e[type=minecraft:arrow,tag=gm4_cb_melon,nbt={inGround:1b}]
# at @s

#plant melon
setblock ~ ~ ~ minecraft:pumpkin_stem

#clear carrot
clear @p[tag=gm4_cb_melon] melon_seeds 1

#remove tag
tag @p[tag=gm4_cb_melon] remove gm4_cb_melon
