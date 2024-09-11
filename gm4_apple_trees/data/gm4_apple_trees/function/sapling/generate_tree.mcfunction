# generates the apple tree
# @s = apple sapling marker
# located at @s
# run from gm4_apple_trees:verify/generate_tree

# place jigsaw gm4_apple_trees:apple_trees gm4_apple_trees:trunk 2 ~ ~1 ~
    # jigsaw generation not usable after world-gen due to inherent position-based randomizaton
function gm4_apple_trees:sapling/grow/generate_random_tree
execute if block ~ ~-1 ~ grass_block run setblock ~ ~-1 ~ dirt
execute positioned ~ ~1 ~ as @e[type=armor_stand,tag=gm4_apple_uninitialized,distance=..6] run function gm4_apple_trees:leaf/initialize
kill @s
