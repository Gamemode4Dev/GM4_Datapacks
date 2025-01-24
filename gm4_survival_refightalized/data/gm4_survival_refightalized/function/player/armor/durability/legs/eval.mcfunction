# set damage on armor item
# @s = player wearing the item
# at unspecified
# 

$item modify entity @s armor.legs {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
