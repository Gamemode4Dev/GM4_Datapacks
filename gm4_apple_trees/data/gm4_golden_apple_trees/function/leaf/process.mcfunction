# removes a golden apple leaf item display if it is not inside a leaf anymore
# @s = gm4_golden_apple
# located at @s
# run from gm4_apple_trees:main

# kill apple item display
execute if entity @s[tag=!gm4_ripe_apple] at @s unless block ~ ~ ~ minecraft:oak_leaves run kill @s
execute if entity @s[tag=gm4_ripe_apple] at @s unless block ~ ~ ~ minecraft:oak_leaves run function gm4_golden_apple_trees:leaf/apple/destroy
