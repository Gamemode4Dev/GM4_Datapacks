# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_natural_trees:generate/king_palm/generation

# set current tree
scoreboard players reset * gm4_tree_type
scoreboard players set king_palm gm4_tree_type 1 

# change tags
tag @s remove gm4_king_palm_sapling
tag @s remove gm4_fruiting_sapling
tag @s add gm4_gv_tree_trunk_marker

# delete sapling
fill ~ ~ ~ ~ ~ ~ air replace #minecraft:saplings

# advancement
advancement grant @a[distance=..15] only gm4:grow_king_palm_tree

# convert nbt to scores
data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/get/scores_from_nbt

# store nbt in storage (for reference during generation)
data modify storage gm4_garden_variety:data/garden_variety_nbt tree_generation set from entity @s data.gm4_garden_variety

# convert soil
execute if score enable_soil_conversion gm4_gv_gen_data matches 1 if score soil_conversion gm4_gv_nbt_data matches 1 unless score generation_mode_orbis gm4_gv_gen_data matches 1 run function gm4_garden_variety:generation/soil_conversion/initialize

# align and begin generation
execute as @s align xyz positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute as @s at @s run function gm4_garden_variety:generation/trees/palm_tree/generate

# kill
kill @s

# reset generation mode
scoreboard players set generation_mode_orbis gm4_gv_gen_data 0
scoreboard players set generation_mode_sapling gm4_gv_gen_data 0
scoreboard players set generation_mode_command gm4_gv_gen_data 0

