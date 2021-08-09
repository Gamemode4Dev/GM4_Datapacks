# attempts to place sapling leaf marker on the current block
# run from gm4_natural_trees:generate/king_palm/generation/palm

function gm4_garden_variety:data/generate/next_seed_value
scoreboard players operation sapling_leaf_success gm4_gv_gen_data = $current_seed gm4_gv_gen_data
scoreboard players operation sapling_leaf_success gm4_gv_gen_data %= sapling_leaves_block_chance gm4_gv_gen_data

execute if score sapling_leaf_success gm4_gv_gen_data matches 0 at @s if block ~ ~ ~ #minecraft:leaves run function gm4_natural_trees:generate/king_palm/leaves/sapling/place
