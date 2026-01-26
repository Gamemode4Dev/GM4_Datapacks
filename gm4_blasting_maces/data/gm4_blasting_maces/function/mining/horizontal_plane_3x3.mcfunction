# Mines a 3x3 horizontal plane (X-Z) around the center block, excluding the center
# @s = none
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# mine the 8 surrounding blocks in a horizontal plane
execute positioned ~-1 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~-1 ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~ ~ ~1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~-1 run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~ run function gm4_blasting_maces:mining/destroy_block
execute positioned ~1 ~ ~1 run function gm4_blasting_maces:mining/destroy_block
