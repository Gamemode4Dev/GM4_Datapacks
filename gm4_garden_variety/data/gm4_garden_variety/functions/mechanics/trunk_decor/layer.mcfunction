# places fruit leaf
# run from gm4_garden_variety_trees:generate/king_palm/generation/decoration/fruit_leaf/attempt


# [Initialize] set fruit direction
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen if score $trunk_decor_side gm4_gv_tree_gen matches 1 as @s run data modify entity @s Rotation[0] set value 0f
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen if score $trunk_decor_side gm4_gv_tree_gen matches 2 as @s run data modify entity @s Rotation[0] set value 90f
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen if score $trunk_decor_side gm4_gv_tree_gen matches 3 as @s run data modify entity @s Rotation[0] set value 180f
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen = $trunk_decor_per_layer gm4_gv_tree_gen if score $trunk_decor_side gm4_gv_tree_gen matches 4 as @s run data modify entity @s Rotation[0] set value 270f

# [Generate] place fruit
execute at @s align xyz positioned ~.5 ~.5 ~.5 if block ^ ^ ^1 air if block ^ ^-1 ^1 air positioned ^ ^ ^1 run function gm4_garden_variety:mechanics/trunk_decor/place
execute at @s run tp @s ~ ~ ~ ~90 ~

# [Loop]
scoreboard players remove $trunk_decor_layer_loop gm4_gv_tree_gen 1
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen matches 1.. if score $fruit_leaves gm4_gv_tree_gen matches 1.. at @s run function gm4_garden_variety:mechanics/trunk_decor/layer
execute if score $trunk_decor_layer_loop gm4_gv_tree_gen matches 0 run kill @s