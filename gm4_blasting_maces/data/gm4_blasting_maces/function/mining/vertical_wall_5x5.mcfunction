# Routes to the correct 5x5 vertical plane based on the player's yaw
# @s = player with blasting mace
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# north/south (facing +/-Z direction, mine X-Y plane)
execute if score @s gm4_blast_yaw matches -45..44 run function gm4_blasting_maces:mining/vertical_xy_5x5
execute if score @s gm4_blast_yaw matches 135..180 run function gm4_blasting_maces:mining/vertical_xy_5x5
execute if score @s gm4_blast_yaw matches -180..-135 run function gm4_blasting_maces:mining/vertical_xy_5x5

# east/west (facing +/-X direction, mine Z-Y plane)
execute if score @s gm4_blast_yaw matches 45..134 run function gm4_blasting_maces:mining/vertical_zy_5x5
execute if score @s gm4_blast_yaw matches -134..-46 run function gm4_blasting_maces:mining/vertical_zy_5x5
