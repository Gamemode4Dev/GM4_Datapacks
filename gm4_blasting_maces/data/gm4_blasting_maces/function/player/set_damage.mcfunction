# Applies damage to the player's held mace
# @s = player with blasting mace
# at @s
# run from gm4_blasting_maces:player/modify_mace_durability with storage

$item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
