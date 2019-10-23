# @s = @e[type=minecraft:arrow,tag=gm4_cb_crops,nbt={inGround:1b}]
# at @s

#replace dirt with farmland
setblock ~ ~-1 ~ minecraft:farmland

#check arrow tag
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_carrot] run function crossbow_cartridges:crops/carrot
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_potato] run function crossbow_cartridges:crops/potato
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_wheat] run function crossbow_cartridges:crops/wheat
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_beet] run function crossbow_cartridges:crops/beetroot
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_pumpkin] run function crossbow_cartridges:crops/pumpkin
execute if entity @s[type=minecraft:arrow,tag=gm4_cb_melon] run function crossbow_cartridges:crops/melon

#kill arrow
kill @s 
