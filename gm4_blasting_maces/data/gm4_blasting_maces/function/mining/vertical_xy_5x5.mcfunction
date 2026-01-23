# Mines a 5x5 vertical plane (X-Y) when facing north or south, excluding the center
# @s = none
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/vertical_wall_5x5

# mine X-Y plane (24 surrounding blocks, no center)
# row y-1
execute positioned ~-2 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~-1 ~ run function gm4_blasting_maces:mining/destroy_block

# row y0 (broken block row, skip center block)
execute positioned ~-2 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~ run function gm4_blasting_maces:mining/destroy_block

# row y+1
execute positioned ~-2 ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~1 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~1 ~ run function gm4_blasting_maces:mining/destroy_block

# row y+2
execute positioned ~-2 ~2 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~2 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~2 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~2 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~2 ~ run function gm4_blasting_maces:mining/destroy_block

# row y+3
execute positioned ~-2 ~3 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~3 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~3 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~3 ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~3 ~ run function gm4_blasting_maces:mining/destroy_block
