#run from crossbow_cartridges_use [advancement]
# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4:crossbow_cartridges_use

#check offhand item
#fish
execute if entity @s[predicate=gm4_crossbow_cartridges:cod] run function gm4_crossbow_cartridges:projectile/fish/cod
execute if entity @s[predicate=gm4_crossbow_cartridges:salmon] run function gm4_crossbow_cartridges:projectile/fish/salmon
execute if entity @s[predicate=gm4_crossbow_cartridges:pufferfish] run function gm4_crossbow_cartridges:projectile/fish/pufferfish
execute if entity @s[predicate=gm4_crossbow_cartridges:tropical] run function gm4_crossbow_cartridges:projectile/fish/tropical

#potions
execute if entity @s[predicate=gm4_crossbow_cartridges:splash_potion] run function gm4_crossbow_cartridges:projectile/splashpotion
execute if entity @s[predicate=gm4_crossbow_cartridges:lingering_potion] run function gm4_crossbow_cartridges:projectile/lingerpotion

#torch
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:torch] run function gm4_crossbow_cartridges:projectile/torch

#fireball
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:fire_charge] run function gm4_crossbow_cartridges:projectile/fireball

#string
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:string] run function gm4_crossbow_cartridges:cables/shoot_arrow
