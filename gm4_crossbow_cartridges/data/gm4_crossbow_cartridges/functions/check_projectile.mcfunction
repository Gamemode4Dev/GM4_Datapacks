#run from advancement shoot
# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4_crossbow_cartridges:shoot

tag @e[type=minecraft:arrow,nbt={inGround:0b},distance=..2,sort=nearest,limit=1] add gm4_cb_arrow

#check offhand item
#string
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/string] run function gm4_crossbow_cartridges:cables/shoot_arrow

#bucket
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:items/bucket] run function gm4_crossbow_cartridges:projectile/bucket

#torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/torch] run function gm4_crossbow_cartridges:projectile/torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/redstone_torch] run function gm4_crossbow_cartridges:projectile/redstone_torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/soul_torch] run function gm4_crossbow_cartridges:projectile/soul_torch

#potions
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:items/splash_potion] run function gm4_crossbow_cartridges:projectile/splashpotion
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:items/lingering_potion] run function gm4_crossbow_cartridges:projectile/lingerpotion

#fireball
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/fire_charge] run function gm4_crossbow_cartridges:projectile/fireball

#tnt
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/tnt] run function gm4_crossbow_cartridges:projectile/tnt

tag @s remove gm4_cb_use
