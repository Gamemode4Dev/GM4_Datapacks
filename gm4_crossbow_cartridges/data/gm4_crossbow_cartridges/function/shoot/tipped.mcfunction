# @s = tipped arrow
# at @s
# run from function shoot/any_arrow

execute if data storage gm4_crossbow_cartridges:temp potion_contents.potion run function gm4_crossbow_cartridges:shoot/potion_effect
execute if data storage gm4_crossbow_cartridges:temp potion_contents.custom_effects run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set from entity @s item.components."minecraft:potion_contents".custom_effects
