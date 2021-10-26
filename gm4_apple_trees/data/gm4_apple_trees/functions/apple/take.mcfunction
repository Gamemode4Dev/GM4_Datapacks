# @s = player taking apple from tree
# at @s
# run from advancement take_apple

advancement revoke @s only gm4_apple_trees:take_apple

tag @s add gm4_apple_take
execute positioned ^ ^ ^2 as @e[type=minecraft:armor_stand,distance=..3,sort=nearest,limit=1,predicate=!gm4_apple_trees:holding_apple] run function gm4_apple_trees:apple/handle_item
tag @s remove gm4_apple_take
