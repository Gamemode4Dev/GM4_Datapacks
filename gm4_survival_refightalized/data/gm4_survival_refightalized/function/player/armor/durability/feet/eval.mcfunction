# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/feet/run

$item modify entity @s armor.feet {type: "minecraft:set_components", components: {"minecraft:damage": $(damage)}}
