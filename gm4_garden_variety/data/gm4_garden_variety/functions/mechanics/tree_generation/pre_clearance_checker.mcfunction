# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


# generate seed
function gm4_garden_variety:utility/get/seed/based_on_mode

# store nbt in storage (for reference during generation)
data remove storage gm4_garden_variety:transfer/gv_nbt tree_generation
data modify storage gm4_garden_variety:transfer/gv_nbt tree_generation set from entity @s data.gm4_garden_variety

# convert nbt to scores
data remove storage gm4_garden_variety:convert/to_scores input
data modify storage gm4_garden_variety:convert/to_scores input set from storage gm4_garden_variety:transfer/gv_nbt tree_generation
function gm4_garden_variety:utility/convert/gv_nbt_to_scores

# modify based on generation mode
execute if score $generation_mode_orbis gm4_gv_tree_gen matches 1 if predicate gm4_garden_variety:biome/snowy run scoreboard players set $snowy gm4_gv_nbt_data 1
