# @s = player who scraped wax
# at @s
# run from mechanics/interactions/waxed_copper_lantern/damage_mainhand_axe

$item modify entity @s weapon.mainhand {type: "minecraft:set_components", components: {"minecraft:damage": $(damage)}}
