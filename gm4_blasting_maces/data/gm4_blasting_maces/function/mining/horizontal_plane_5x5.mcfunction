# Mines a 5x5 horizontal plane (X-Z) around the center block, excluding the center
# @s = none
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# mine X-Z plane (24 surrounding blocks, no center)
# row z-2
execute positioned ~-2 ~ ~-2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~-2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~-2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~-2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~-2 run function gm4_blasting_maces:mining/destroy_block

# row z-1
execute positioned ~-2 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block

# row z0 (center row, skip center block)
execute positioned ~-2 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~ run function gm4_blasting_maces:mining/destroy_block

# row z+1
execute positioned ~-2 ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~1 run function gm4_blasting_maces:mining/destroy_block

# row z+2
execute positioned ~-2 ~ ~2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~2 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~2 ~ ~2 run function gm4_blasting_maces:mining/destroy_block
