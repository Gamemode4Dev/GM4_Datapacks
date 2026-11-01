# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/legs/run

$item modify entity @s armor.legs {type: "minecraft:set_components", components: {"minecraft:damage": $(damage)}}
