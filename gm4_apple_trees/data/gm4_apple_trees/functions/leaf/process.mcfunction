# removes an apple leaf armor stand if it is not inside a leaf anymore
# @s = gm4_apple armor stand
# located at @s align xyz
# run from gm4_apple_trees:main

# kill apple armor stands
execute if entity @s[tag=!gm4_ripe_apple] at @s unless block ~ ~1 ~ minecraft:oak_leaves run kill @s
execute if entity @s[tag=gm4_ripe_apple] at @s unless block ~ ~2 ~ minecraft:oak_leaves run function gm4_apple_trees:leaf/apple/destroy
