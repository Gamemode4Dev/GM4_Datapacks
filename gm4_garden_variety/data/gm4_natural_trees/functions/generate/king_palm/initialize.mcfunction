# initializes the TREE_TYPE tree's AEC marker
# @s = TREE_TYPE generation AEC marker
# run from gm4_natural_trees:generate/king_palm/generation

# generate seed
function gm4_garden_variety:data/generate/seed/based_on_mode

# set tree variables
function gm4_natural_trees:generate/king_palm/variables/tree_default

# check clearance
scoreboard players set clearance_check gm4_gv_gen_data 1
scoreboard players operation clearance_check_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data
execute at @s align xyz positioned ~.5 ~ ~.5 run summon marker ~ ~ ~ {Tags:["gm4_gv_clearance_checker_marker"]}
execute at @s run execute as @e[type=marker,tag=gm4_gv_clearance_checker_marker,limit=1,sort=nearest] at @s run function gm4_garden_variety:generation/clearance_checker/check

# generate if space is available
execute if score clearance_check gm4_gv_gen_data matches 1 run function gm4_natural_trees:generate/king_palm/generate

