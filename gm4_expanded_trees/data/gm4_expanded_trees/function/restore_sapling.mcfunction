# restore sapling if tree could not grow
# @s = sapling marker
# located at @s
# run from generate_tree

tag @s remove gm4_expanded_trees_sapling.target
execute if entity @s[tag=gm4_acacia_tree_sapling] run fill ~ ~ ~ ~ ~ ~ acacia_sapling replace air
execute if entity @s[tag=gm4_birch_tree_sapling] run fill ~ ~ ~ ~ ~ ~ birch_sapling replace air
execute if entity @s[tag=gm4_cherry_tree_sapling] run fill ~ ~ ~ ~ ~ ~ cherry_sapling replace air
execute if entity @s[tag=gm4_dark_oak_tree_sapling] run fill ~ ~ ~ ~ ~ ~ dark_oak_sapling replace air
execute if entity @s[tag=gm4_mangrove_tree_sapling] run fill ~ ~ ~ ~ ~ ~ mangrove_propagule[age=4,waterlogged=false] replace air
execute if entity @s[tag=gm4_mangrove_tree_sapling] run fill ~ ~ ~ ~ ~ ~ mangrove_propagule[age=4,waterlogged=true] replace water
execute if entity @s[tag=gm4_oak_tree_sapling] run fill ~ ~ ~ ~ ~ ~ oak_sapling replace air
execute if entity @s[tag=gm4_pale_oak_tree_sapling] run fill ~ ~ ~ ~ ~ ~ pale_oak_sapling replace air
