# generates the tree - mega {{type}}
# @s = sapling marker
# located at @s (offset to be at the negative corner of the 2x2)
# run from generate_mega_tree

execute store result score $tree_variant gm4_towering_trees_data run random value 1..{{variant_count}}

{{functions}}

{{ground_replacement}}
