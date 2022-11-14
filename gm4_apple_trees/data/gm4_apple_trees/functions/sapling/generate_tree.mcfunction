# generates the apple tree
# @s = apple sapling marker
# located at @s
# run from gm4_apple_trees:verify/generate_tree

place jigsaw gm4_apple_trees:apple_trees gm4_apple_trees:trunk 2 ~ ~1 ~
execute positioned ~ ~1 ~ as @e[type=armor_stand,tag=gm4_apple_uninitialized,distance=..6] run function gm4_apple_trees:leaf/initialize
kill @s
