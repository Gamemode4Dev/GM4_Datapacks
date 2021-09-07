# advances the stage of the fruit
# @s = TREE_TYPE_fruit_leaf
# at @s align xyz
# run from gm4_garden_variety_trees:fruiting/tree/leaf/fruiting/validate_species

# set the visual stage of the fruit depending the score

execute if score @s gm4_fruit_age = #red_berry_fruit_stage_1_start gm4_gv_math_num run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/1
execute if score @s gm4_fruit_age = #red_berry_fruit_stage_2_start gm4_gv_math_num run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/2
execute if score @s gm4_fruit_age = #red_berry_fruit_stage_0_start gm4_gv_math_num run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/0
