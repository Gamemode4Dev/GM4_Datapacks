
# check for valid ladder placement location
scoreboard players set $loop gm4_rol_data 0
execute anchored eyes run function gm4_rope_ladders:mechanics/ladder_placement/scan_column/loop
