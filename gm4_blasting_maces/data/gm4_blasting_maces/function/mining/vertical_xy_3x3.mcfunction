# Mines a 3x3 vertical plane (X-Y) when facing north or south, excluding the center
# @s = none
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/vertical_wall_3x3

# mine X-Y plane (8 surrounding blocks)
execute positioned ~-1 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~1 ~ run function gm4_blasting_maces:mining/destroy_block
