# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/head/run

playsound minecraft:entity.item.break player @s ~ ~ ~ 1 1
item replace entity @s armor.head with air
