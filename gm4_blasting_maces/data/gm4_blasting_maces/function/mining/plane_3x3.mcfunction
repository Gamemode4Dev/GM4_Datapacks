# Breaks the full 3x3 plane (the centre block and the 8 around it) in the plane of the hit face
# @s = none
# at the centre of the hit block, rotated so the 3x3 lies in the plane of the hit face
# run from gm4_blasting_maces:player/blast

function gm4_blasting_maces:mining/destroy_block
execute positioned ^-1 ^-1 ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^ ^-1 ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^1 ^-1 ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^-1 ^ ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^1 ^ ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^-1 ^1 ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^ ^1 ^ run function gm4_blasting_maces:mining/destroy_block
execute positioned ^1 ^1 ^ run function gm4_blasting_maces:mining/destroy_block
