#run from crops/crop_check
# @s = @e[type=minecraft:arrow,tag=gm4_cb_crops,nbt={inGround:1b}]
# at @s

#place crop
execute if entity @s[tag=gm4_cb_carrot] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:carrot",Count:1b}}
execute if entity @s[tag=gm4_cb_potato] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:potato",Count:1b}}
execute if entity @s[tag=gm4_cb_wheat] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:wheat_seeds",Count:1b}}
execute if entity @s[tag=gm4_cb_beet] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:beetroot_seeds",Count:1b}}
execute if entity @s[tag=gm4_cb_pumpkin] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:pumpkin_seeds",Count:1b}}
execute if entity @s[tag=gm4_cb_melon] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:melon_seeds",Count:1b}}
