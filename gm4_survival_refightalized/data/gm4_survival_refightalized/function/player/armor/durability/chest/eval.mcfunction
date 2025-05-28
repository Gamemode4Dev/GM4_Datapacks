# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/chest/run

$item modify entity @s armor.chest {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
