# @s = armor_stand, with apple taken from apple tree
# at player picking the apple
# run from apple/interact

# return item to player
item replace entity @a[tag=gm4_apple_take,limit=1] weapon.mainhand from entity @s weapon.mainhand gm4_apple_trees:count

# update armour stand
execute at @s align xyz run function gm4_apple_trees:tree/leaf/fruiting/set_stage/0
