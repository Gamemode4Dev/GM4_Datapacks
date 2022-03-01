# Check item in offhand to shoot
# @s = player using the crossbow
# at arrow
# run from functions in shoot/

# tripwire
execute if entity @s[gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/string,x_rotation=-15..15] align xyz positioned ~0.5 ~ ~0.5 run function gm4_crossbow_cartridges:cables/shoot_arrow

# bucket with fish/axolotl
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:items/bucket] run function gm4_crossbow_cartridges:projectile/bucket

# torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/torch] run function gm4_crossbow_cartridges:projectile/torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/redstone_torch] run function gm4_crossbow_cartridges:projectile/redstone_torch
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/soul_torch] run function gm4_crossbow_cartridges:projectile/soul_torch

# potions
execute if entity @s[tag=!gm4_cb_use,predicate=gm4_crossbow_cartridges:items/potions] run function gm4_crossbow_cartridges:projectile/potions

# fireball
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/fire_charge] run function gm4_crossbow_cartridges:projectile/fireball

# tnt
execute if entity @s[tag=!gm4_cb_use,gamemode=!adventure,predicate=gm4_crossbow_cartridges:items/tnt] run function gm4_crossbow_cartridges:projectile/tnt

tag @s remove gm4_cb_use
data remove storage gm4_crossbow_cartridges:temp projectile
