#run from gm4_crossbow_cartridges:shoot [advancement]
# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4_crossbow_cartridges:shoot

tag @e[type=minecraft:arrow,nbt={inGround:0b},distance=..2,sort=nearest,limit=1] add gm4_cb_arrow

#string
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:string] run function gm4_crossbow_cartridges:cables/shoot_arrow

#fish
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:cod] run function gm4_crossbow_cartridges:projectile/fish/cod
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:salmon] run function gm4_crossbow_cartridges:projectile/fish/salmon
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:pufferfish] run function gm4_crossbow_cartridges:projectile/fish/pufferfish
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:tropical] run function gm4_crossbow_cartridges:projectile/fish/tropical

#torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:torch] run function gm4_crossbow_cartridges:projectile/torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:redstone_torch] run function gm4_crossbow_cartridges:projectile/redstone_torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:soul_torch] run function gm4_crossbow_cartridges:projectile/soul_torch

#potions
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:splash_potion] run function gm4_crossbow_cartridges:projectile/splashpotion
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:lingering_potion] run function gm4_crossbow_cartridges:projectile/lingerpotion

#fireball
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:fire_charge] run function gm4_crossbow_cartridges:projectile/fireball

#tnt
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:tnt] run function gm4_crossbow_cartridges:projectile/tnt

tag @s remove gm4_cb_use
