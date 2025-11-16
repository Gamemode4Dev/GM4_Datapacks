# generates the tree
# @s = sapling marker
# located at @s
# run from gm4_expanded_trees:verify/generate_tree

# check if this is a big tree
execute store result score $big_tree gm4_expanded_trees_data run function gm4_expanded_trees:check_for_giant_tree
execute if score $big_tree gm4_expanded_trees_data matches 1.. run say big
execute if score $big_tree gm4_expanded_trees_data matches 0 run say normal

# if it is a big tree mark the related saplings and clear their space
execute if score $big_tree gm4_expanded_trees_data matches 1 align xyz as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=4,dx=1,dy=0,dz=1] at @s run function gm4_expanded_trees:mark_sapling
execute if score $big_tree gm4_expanded_trees_data matches 2 positioned ~ ~ ~-1 align xyz as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=4,dx=1,dy=0,dz=1] at @s run function gm4_expanded_trees:mark_sapling
execute if score $big_tree gm4_expanded_trees_data matches 3 positioned ~-1 ~ ~ align xyz as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=4,dx=1,dy=0,dz=1] at @s run function gm4_expanded_trees:mark_sapling
execute if score $big_tree gm4_expanded_trees_data matches 4 positioned ~-1 ~ ~-1 align xyz as @e[type=marker,tag=gm4_expanded_trees_sapling,limit=4,dx=1,dy=0,dz=1] at @s run function gm4_expanded_trees:mark_sapling
# if not just mark self
execute if score $big_tree gm4_expanded_trees_data matches 0 run function gm4_expanded_trees:mark_sapling

# generate giant tree positionionally based on which sapling grew
execute if score $big_tree gm4_expanded_trees_data matches 1 run function gm4_expanded_trees:generate_giant_tree
execute if score $big_tree gm4_expanded_trees_data matches 2 positioned ~ ~ ~-1 run function gm4_expanded_trees:generate_giant_tree
execute if score $big_tree gm4_expanded_trees_data matches 3 positioned ~-1 ~ ~ run function gm4_expanded_trees:generate_giant_tree
execute if score $big_tree gm4_expanded_trees_data matches 4 positioned ~-1 ~ ~-1 run function gm4_expanded_trees:generate_giant_tree
# small trees
execute if score $big_tree gm4_expanded_trees_data matches 0 run function gm4_expanded_trees:generate_normal_tree

# remove the saplings
execute if score $tree_placed gm4_expanded_trees_data matches 1 run kill @e[type=marker,tag=gm4_expanded_trees_sapling.target,limit=4,distance=..3]
execute if score $tree_placed gm4_expanded_trees_data matches 0 as @e[type=marker,tag=gm4_expanded_trees_sapling.target,limit=4,distance=..3] at @s run function gm4_expanded_trees:restore_sapling
