# @s = player who scraped wax
# at @s
# run from mechanics/interactions/waxed_copper_lantern/damage_offhand_axe

$item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
