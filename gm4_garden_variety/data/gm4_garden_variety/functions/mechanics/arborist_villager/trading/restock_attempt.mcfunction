# run from TODO

# restock randomizer
function gm4_garden_variety:utility/generate/seed/random
scoreboard players operation $restock_check gm4_gv_arborist = $current_seed gm4_gv_tree_gen
scoreboard players operation $restock_check gm4_gv_arborist %= #10 gm4_gv_math_num 

# restock
execute if score $restock_check gm4_gv_arborist matches 0..3 run function gm4_garden_variety:mechanics/arborist_villager/trading/restock
execute if score $restock_check gm4_gv_arborist matches 0..3 run tag @s remove gm4_gv_can_restock
