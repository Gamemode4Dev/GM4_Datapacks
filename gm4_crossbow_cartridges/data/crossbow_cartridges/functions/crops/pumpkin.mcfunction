# @s = @e[type=minecraft:arrow,tag=gm4_cb_pumpkin,nbt={inGround:1b}]
# at @s

#plant pumpkin
setblock ~ ~ ~ minecraft:pumpkin_stem

#clear carrot
clear @p[tag=gm4_cb_pumpkin] pumpkin_seeds 1

#remove tag
tag @p[tag=gm4_cb_pumpkin] remove gm4_cb_pumpkin
