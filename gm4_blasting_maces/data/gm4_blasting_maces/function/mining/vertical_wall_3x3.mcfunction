# Mines a 3x3 vertical wall perpendicular to the player's facing direction, excluding the center
# @s = player with blasting mace
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# use local coordinates with player's yaw (^left ^up ^forward)
# rotated ~ 0 ensures horizontal plane for left/right movement
execute rotated as @s rotated ~ 0 positioned ^-1 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
