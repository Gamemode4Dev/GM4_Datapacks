# Applies the new damage value to the mace in the held slot
# @s = player holding the blasting mace
# at @s
# run from gm4_blasting_maces:player/durability/calculate with storage

$item modify entity @s $(slot) {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
