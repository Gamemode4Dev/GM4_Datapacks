# places fruit leaf
# run from gm4_natural_trees:generate/king_palm/generation/decoration/fruit_leaf/attempt



# set fruit direction
execute if score trunk_fruit_layer_loop gm4_gv_gen_data = $trunk_fruit_per_layer gm4_gv_gen_data if score trunk_fruit_side gm4_gv_gen_data matches 1 as @s run data modify entity @s Rotation[0] set value 0f
execute if score trunk_fruit_layer_loop gm4_gv_gen_data = $trunk_fruit_per_layer gm4_gv_gen_data if score trunk_fruit_side gm4_gv_gen_data matches 2 as @s run data modify entity @s Rotation[0] set value 90f
execute if score trunk_fruit_layer_loop gm4_gv_gen_data = $trunk_fruit_per_layer gm4_gv_gen_data if score trunk_fruit_side gm4_gv_gen_data matches 3 as @s run data modify entity @s Rotation[0] set value 180f
execute if score trunk_fruit_layer_loop gm4_gv_gen_data = $trunk_fruit_per_layer gm4_gv_gen_data if score trunk_fruit_side gm4_gv_gen_data matches 4 as @s run data modify entity @s Rotation[0] set value 270f

# place fruit
execute at @s align xyz positioned ~.5 ~.5 ~.5 if block ^ ^ ^1 air if block ^ ^-1 ^1 air positioned ^ ^ ^1 run function gm4_garden_variety:generation/trunk_fruit/place
execute at @s run tp @s ~ ~ ~ ~90 ~

# loop
scoreboard players remove trunk_fruit_layer_loop gm4_gv_gen_data 1
execute if score trunk_fruit_layer_loop gm4_gv_gen_data matches 1.. if score $fruit_leaves gm4_gv_gen_data matches 1.. at @s run function gm4_garden_variety:generation/trunk_fruit/layer
execute if score trunk_fruit_layer_loop gm4_gv_gen_data matches 0 run kill @s