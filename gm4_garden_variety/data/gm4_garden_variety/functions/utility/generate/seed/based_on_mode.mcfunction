# generates a new seed using the tree's uuid
# @s = custom tree marker
# run from TODO

# generate seed
execute if score $seed_mode_orbis gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/generate/seed/location
execute if score $seed_mode_sapling gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/generate/seed/random
execute if score $seed_mode_command gm4_gv_tree_gen matches 1 as @s run function gm4_garden_variety:utility/generate/seed/location

# reset seed mode
scoreboard players set $seed_mode_orbis gm4_gv_tree_gen 0
scoreboard players set $seed_mode_sapling gm4_gv_tree_gen 0
scoreboard players set $seed_mode_command gm4_gv_tree_gen 0
