# scans downward until it finds a valid location to place a ladder
# @s = interacted rcd
# at location of ladder block, moving downward
# run from function: gm4_rope_ladders:mechanics/ladder_placement/find_ladder

# detect if ladder placement is valid
execute if block ~ ~ ~ #gm4:replaceable run return run function gm4_rope_ladders:mechanics/ladder_placement/place_ladder

# loop
scoreboard players add $loop gm4_rol_data 1
execute if score $loop gm4_rol_data matches 0..511 unless score $ladder_placed gm4_rol_data matches 1 if block ~ ~-1 ~ #gm4_rope_ladders:ladder_scan positioned ~ ~-1 ~ run function gm4_rope_ladders:mechanics/ladder_placement/scan_column
