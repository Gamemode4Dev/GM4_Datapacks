# @s = armor_stand, with apple taken from apple tree
# at @s
# run from apple/take

# return item to player
item replace entity @p[tag=gm4_apple_take] weapon.mainhand from entity @s weapon.mainhand gm4_apple_trees:count

# update armour stand
execute at @s align xyz run function gm4_apple_trees:tree/leaf/fruiting/set_stage/0
