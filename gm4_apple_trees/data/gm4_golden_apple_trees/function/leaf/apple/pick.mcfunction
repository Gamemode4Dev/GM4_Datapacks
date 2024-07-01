# update stack count and leaf stage
# @s = armor_stand, with apple taken from apple tree
# at @s align xyz
# run from gm4_apple_trees:leaf/apple/interact

# return item to player
item replace entity @a[tag=gm4_apple_take,limit=1,gamemode=!creative] weapon.mainhand from entity @s weapon.mainhand gm4_apple_trees:count

# update armour stand
function gm4_golden_apple_trees:leaf/set_stage/0