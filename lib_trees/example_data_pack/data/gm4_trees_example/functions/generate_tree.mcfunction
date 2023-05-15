# generates the example tree
# @s = example sapling marker
# located at @s
# run from gm4_trees_example:verify/generate_tree

# generate tree using custom structure
place jigsaw gm4_trees_example:apple_trees gm4_trees:trunk 6 ~ ~1 ~
kill @s

# replace grass with dirt (optional)
execute if block ~ ~-1 ~ grass_block run setblock ~ ~-1 ~ dirt
