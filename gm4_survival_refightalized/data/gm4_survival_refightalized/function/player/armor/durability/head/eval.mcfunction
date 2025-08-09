# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/head/run

$item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
