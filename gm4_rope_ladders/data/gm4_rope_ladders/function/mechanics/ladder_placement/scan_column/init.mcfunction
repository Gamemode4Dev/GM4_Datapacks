# begins a scan downward until it finds a valid location to place a ladder
# @s = player that interacts with a "right click detection" villager while holding ladder
# at location of ladder block
# run from function: gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/found

# check for valid ladder placement location
scoreboard players set $loop gm4_rol_data 0
execute anchored eyes run function gm4_rope_ladders:mechanics/ladder_placement/scan_column/loop
