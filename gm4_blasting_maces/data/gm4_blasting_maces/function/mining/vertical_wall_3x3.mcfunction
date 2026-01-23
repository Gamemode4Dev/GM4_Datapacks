# Routes to the correct 3x3 vertical plane based on the player's yaw
# @s = player with blasting mace
# at marker (center of broken block)
# run from gm4_blasting_maces:mining/detonate

# yaw determines direction:
# -45 to 45 = South (+Z) -> X-Y plane
# 45 to 135 = West (-X) -> Z-Y plane
# 135 to 180 OR -180 to -135 = North (-Z) -> X-Y plane
# -135 to -45 = East (+X) -> Z-Y plane

# north/south (facing +/-Z direction, mine X-Y plane)
execute if score @s gm4_blast_yaw matches -45..44 run function gm4_blasting_maces:mining/vertical_xy_3x3
execute if score @s gm4_blast_yaw matches 135..180 run function gm4_blasting_maces:mining/vertical_xy_3x3
execute if score @s gm4_blast_yaw matches -180..-135 run function gm4_blasting_maces:mining/vertical_xy_3x3

# east/west (facing +/-X direction, mine Z-Y plane)
execute if score @s gm4_blast_yaw matches 45..134 run function gm4_blasting_maces:mining/vertical_zy_3x3
execute if score @s gm4_blast_yaw matches -134..-46 run function gm4_blasting_maces:mining/vertical_zy_3x3
