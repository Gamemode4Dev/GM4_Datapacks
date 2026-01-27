# generates the tree - mega
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_tree

# towering
execute if entity @s[tag=gm4_oak_tree_sapling] run return run function gm4_towering_trees:generate_tree_type/oak/pick_variant
execute if entity @s[tag=gm4_acacia_tree_sapling] run return run function gm4_towering_trees:generate_tree_type/acacia/pick_variant
execute if entity @s[tag=gm4_cherry_tree_sapling] run return run function gm4_towering_trees:generate_tree_type/cherry/pick_variant
execute if entity @s[tag=gm4_mangrove_tree_sapling] run return run function gm4_towering_trees:generate_tree_type/mangrove/pick_variant
execute if entity @s[tag=gm4_birch_tree_sapling] run return run function gm4_towering_trees:generate_tree_type/birch/pick_variant

# vanilla - needs to remove the saplings first so they can be placed
execute align xyz as @e[type=marker,tag=gm4_towering_trees_sapling,dx=1,dy=0,dz=1] at @s run function gm4_towering_trees:clear_sapling

execute if entity @s[tag=gm4_pale_oak_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:pale_oak_bonemeal
execute if entity @s[tag=gm4_dark_oak_tree_sapling] store success score $tree_placed gm4_towering_trees_data run place feature minecraft:dark_oak

# replace sapling if placement failed
execute if score $tree_placed gm4_towering_trees_data matches 0 align xyz as @e[type=marker,tag=gm4_towering_trees_sapling,dx=1,dy=0,dz=1] at @s run function gm4_towering_trees:replace_sapling
