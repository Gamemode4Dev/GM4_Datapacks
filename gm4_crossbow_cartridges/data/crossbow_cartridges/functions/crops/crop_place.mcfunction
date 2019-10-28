#run from crops/crop_check
# @s = @e[type=minecraft:arrow,tag=gm4_cb_crops,nbt={inGround:1b}]
# at @s

#place farmland
setblock ~ ~-.5 ~ minecraft:farmland

#place crop
execute if entity @s[tag=gm4_cb_carrot] run setblock ~ ~.5 ~ minecraft:carrots
execute if entity @s[tag=gm4_cb_potato] run setblock ~ ~.5 ~ minecraft:potatoes
execute if entity @s[tag=gm4_cb_wheat] run setblock ~ ~.5 ~ minecraft:wheat
execute if entity @s[tag=gm4_cb_beet] run setblock ~ ~.5 ~ minecraft:beetroots
execute if entity @s[tag=gm4_cb_pumpkin] run setblock ~ ~.5 ~ minecraft:pumpkin_stem
execute if entity @s[tag=gm4_cb_melon] run setblock ~ ~.5 ~ minecraft:melon_stem
