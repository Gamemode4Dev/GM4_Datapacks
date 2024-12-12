# update sharpness lore on weapon
# @s = player holding the item
# at unspecified
# run from weapon/update_sharpness

$item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:{"minecraft:lore":$(lore)}}
