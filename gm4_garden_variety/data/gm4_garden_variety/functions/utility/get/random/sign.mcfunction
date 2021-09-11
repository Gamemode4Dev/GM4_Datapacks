# generates a random sign using the tree's seed
# @s = any equation that needs a random sign (-/+)
# run from #gm4_garden_variety:utility/get/random_sign

# generate random sign based on current seed
function gm4_garden_variety:utility/get/seed/next_value
scoreboard players operation random_sign gm4_gv_math_num = $current_seed gm4_gv_tree_gen
scoreboard players operation random_sign gm4_gv_math_num %= #2 gm4_gv_math_num
execute if score random_sign gm4_gv_math_num matches 0 run scoreboard players set random_sign gm4_gv_math_num -1

