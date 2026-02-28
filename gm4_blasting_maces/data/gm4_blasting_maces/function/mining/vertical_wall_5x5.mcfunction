# Mines a 5x5 vertical wall perpendicular to the player's facing direction, excluding the center
# @s = player with blasting mace
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# use local coordinates with player's yaw (^left ^up ^forward)
# rotated ~ 0 ensures horizontal plane for left/right movement

# row y-1
execute rotated as @s rotated ~ 0 positioned ^-2 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^2 ^-1 ^0 run function gm4_blasting_maces:mining/destroy_block

# row y0 (center row, skip center block)
execute rotated as @s rotated ~ 0 positioned ^-2 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^2 ^0 ^0 run function gm4_blasting_maces:mining/destroy_block

# row y+1
execute rotated as @s rotated ~ 0 positioned ^-2 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^2 ^1 ^0 run function gm4_blasting_maces:mining/destroy_block

# row y+2
execute rotated as @s rotated ~ 0 positioned ^-2 ^2 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^2 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^2 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^2 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^2 ^2 ^0 run function gm4_blasting_maces:mining/destroy_block

# row y+3
execute rotated as @s rotated ~ 0 positioned ^-2 ^3 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^-1 ^3 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^0 ^3 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^1 ^3 ^0 run function gm4_blasting_maces:mining/destroy_block
execute rotated as @s rotated ~ 0 positioned ^2 ^3 ^0 run function gm4_blasting_maces:mining/destroy_block
