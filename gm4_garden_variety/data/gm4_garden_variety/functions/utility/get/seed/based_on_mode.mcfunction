# generates the seed based on the mode
# @s = @s
# run from gm4_garden_variety:mechanics/tree_generation/pre_clearance_checker


# generate seed
execute if score $seed_mode_orbis gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/get/seed/location
execute if score $seed_mode_sapling gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/get/seed/random
execute if score $seed_mode_command gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/get/seed/location

# reset seed mode
scoreboard players set $seed_mode_orbis gm4_gv_tree_gen 0
scoreboard players set $seed_mode_sapling gm4_gv_tree_gen 0
scoreboard players set $seed_mode_command gm4_gv_tree_gen 0
