# stops the raycast and gets read to scan downward
# @s = player that interacts with a "right click detection" villager while holding ladder
# at location of ladder block 
# run from function: gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/ray

# stop raycast
scoreboard players set $ladder_found gm4_rol_data 1

# scan downward to find valid ladder placement
function gm4_rope_ladders:mechanics/ladder_placement/scan_column/init
