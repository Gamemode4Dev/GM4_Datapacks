# generates the tree - mega {{type}}
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_tree_type/{{type}}/pick_variant

# check trunk
execute store result score $blocks_moved gm4_towering_trees_data positioned ~ ~ ~ run clone ~ ~ ~ ~{{is_mega}} ~{{check_1_height}} ~{{is_mega}} ~ ~ ~ filtered #gm4_towering_trees:tree_placeable move
execute unless score $blocks_moved gm4_towering_trees_data matches {{check_1_count}} run return fail

# check box 2
execute store result score $blocks_moved gm4_towering_trees_data positioned ~{{base_x_offset}} ~{{branch_height}} ~{{base_z_offset}} run clone ~ ~ ~ ~{{check_2_x}} ~{{check_2_height}} ~{{check_2_z}} ~ ~ ~ filtered #gm4_towering_trees:tree_placeable move
execute unless score $blocks_moved gm4_towering_trees_data matches {{check_2_count}} run return fail

# optional feature
{{feature}}

# place tree
execute store result score $tree_rotation gm4_towering_trees_data run random value 1..4
execute if score $tree_rotation gm4_towering_trees_data matches 1 run place template gm4_towering_trees:{{type}}/{{variant}} ~{{x_offset}} ~ ~{{z_offset}}
execute if score $tree_rotation gm4_towering_trees_data matches 2 run place template gm4_towering_trees:{{type}}/{{variant}} ~{{x_offset_180}} ~ ~{{z_offset_180}} 180
execute if score $tree_rotation gm4_towering_trees_data matches 3 run place template gm4_towering_trees:{{type}}/{{variant}} ~{{x_offset_c90}} ~ ~{{z_offset_c90}} clockwise_90
execute if score $tree_rotation gm4_towering_trees_data matches 4 run place template gm4_towering_trees:{{type}}/{{variant}} ~{{x_offset_cc90}} ~ ~{{z_offset_cc90}} counterclockwise_90

# mark as placed
scoreboard players set $tree_placed gm4_towering_trees_data 1
