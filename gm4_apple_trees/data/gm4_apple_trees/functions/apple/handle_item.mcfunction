# @s = armor_stand, with apple taken from apple tree
# at @s
# run from apple/take

give @p[tag=gm4_apple_take] apple 1

item replace entity @p[tag=gm4_apple_take] weapon.mainhand from entity @s weapon.mainhand
data remove entity @s HandItems[0]

data modify entity @s DisabledSlots set value 63
