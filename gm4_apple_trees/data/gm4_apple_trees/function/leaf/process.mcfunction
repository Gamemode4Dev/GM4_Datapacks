# removes an apple leaf item displau if it is not inside a leaf anymore
# @s = gm4_apple item display
# located at @s
# run from gm4_apple_trees:main

# kill apple item display
execute if entity @s[tag=!gm4_ripe_apple] unless block ~ ~ ~ minecraft:oak_leaves run kill @s
execute if entity @s[tag=gm4_ripe_apple] unless block ~ ~ ~ minecraft:oak_leaves run function gm4_apple_trees:leaf/apple/destroy
