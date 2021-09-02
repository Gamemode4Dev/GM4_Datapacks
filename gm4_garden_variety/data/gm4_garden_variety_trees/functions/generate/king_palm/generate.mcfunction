# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_garden_variety_trees:generate/king_palm/generation

# [Initialize] generate seed
function gm4_garden_variety:data/generate/seed/based_on_mode

# [Initialize] set tree variables
function gm4_garden_variety_trees:generate/king_palm/variables/tree_default

# [Initialize] convert nbt to scores
data modify storage gm4_garden_variety:convert/to_scores input set from entity @s data.gm4_garden_variety
function gm4_garden_variety:data/convert/nbt_to_scores

# [Initialize] store nbt in storage (for reference during generation)
data modify storage gm4_garden_variety:transfer/gv_nbt tree_generation set from entity @s data.gm4_garden_variety

# [Initialize] modify based on generation mode
execute if score $generation_mode_orbis gm4_gv_gen_data matches 1 if predicate gm4_garden_variety:biome/snowy run scoreboard players set $snowy gm4_gv_nbt_data 1

# [Checker/Generation] generate if clearance passes check
scoreboard players set $clearance_check gm4_gv_gen_data 1
scoreboard players operation $clearance_check_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_clearance_checker_marker"]}
execute unless score $clearance_checker gm4_gv_nbt_data matches 0 at @s run execute as @e[type=marker,tag=gm4_gv_clearance_checker_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:mechanics/clearance_checker/check
execute if score $clearance_check gm4_gv_gen_data matches 1 run function gm4_garden_variety_trees:generate/king_palm/initialize