# scans downward until it finds a valid location to place a ladder
# @s = player that interacts with a "right click detection" villager while holding ladder
# at location of ladder block, moving downward
# run from function: gm4_rope_ladders:mechanics/ladder_placement/scan_column/init

# detect if ladder placement is valid
execute if block ~ ~ ~ #gm4_rope_ladders:valid_replace run function gm4_rope_ladders:mechanics/ladder_placement/scan_column/found

# loop
scoreboard players add $loop gm4_rol_data 1
execute if score $loop gm4_rol_data matches 0..511 unless score $ladder_placed gm4_rol_data matches 1 if block ~ ~-1 ~ #gm4_rope_ladders:ladder_scan positioned ~ ~-1 ~ run function gm4_rope_ladders:mechanics/ladder_placement/scan_column/loop
