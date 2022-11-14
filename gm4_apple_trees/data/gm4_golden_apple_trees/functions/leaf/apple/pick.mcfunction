# update stack count and leaf stage
# @s = armor_stand, with apple taken from apple tree
# at player picking the apple
# run from gm4_apple_trees:leaf/apple/interact

# return item to player
item replace entity @a[tag=gm4_apple_take,limit=1] weapon.mainhand from entity @s weapon.mainhand gm4_apple_trees:count

# update armour stand
execute at @s align xyz positioned ~0.5 ~1.5 ~0.5 positioned ^-.25 ^ ^.1 run function gm4_golden_apple_trees:leaf/apple/drop
