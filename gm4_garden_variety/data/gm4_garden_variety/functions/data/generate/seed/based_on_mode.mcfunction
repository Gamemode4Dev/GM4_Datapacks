# generates a new seed using the tree's uuid
# @s = custom tree marker
# run from TODO

# generate seed
execute if score $seed_mode_orbis gm4_gv_gen_data matches 1 as @s run function gm4_garden_variety:data/generate/seed/location
execute if score $seed_mode_sapling gm4_gv_gen_data matches 1 as @s run function gm4_garden_variety:data/generate/seed/random
execute if score $seed_mode_command gm4_gv_gen_data matches 1 as @s run function gm4_garden_variety:data/generate/seed/location

# reset seed mode
scoreboard players set $seed_mode_orbis gm4_gv_gen_data 0
scoreboard players set $seed_mode_sapling gm4_gv_gen_data 0
scoreboard players set $seed_mode_command gm4_gv_gen_data 0
