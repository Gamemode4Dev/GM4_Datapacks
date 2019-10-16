# @s = @e[type=minecraft:arrow,tag=gm4_cb_crops,nbt={inGround:1b}]
# at @s

#replace dirt with farmland
setblock ~ ~-1 ~ minecraft:farmland

#check arrow tag
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_carrot] run function better_crossbows:crops/carrot
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_potato] run function better_crossbows:crops/potato
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_wheat] run function better_crossbows:crops/wheat
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_beet] run function better_crossbows:crops/beetroot
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_pumpkin] run function better_crossbows:crops/pumpkin
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_melon] run function better_crossbows:crops/melon

#kill arrow
kill @s 
