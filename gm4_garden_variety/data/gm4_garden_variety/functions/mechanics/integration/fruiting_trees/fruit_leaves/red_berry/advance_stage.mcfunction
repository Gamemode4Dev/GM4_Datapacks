# advances the fruit stage
# @s = @e[type=armor_stand,tag=gm4_fruiting_leaf]
# at @s align xyz
# run from gm4_garden_variety:integration/fruiting_trees/update_leaves


# set the visual stage of the fruit depending the score
execute if score @s gm4_fruit_age = #red_berry_fruit_stage_1_start gm4_gv_fruit run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/1
execute if score @s gm4_fruit_age = #red_berry_fruit_stage_2_start gm4_gv_fruit run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/2
execute if score @s gm4_fruit_age = #red_berry_fruit_stage_0_start gm4_gv_fruit run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/set_stage/0
