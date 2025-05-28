# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from player/armor/durability/feet/run

playsound minecraft:entity.item.break player @s ~ ~ ~ 1 1
item replace entity @s armor.feet with air
