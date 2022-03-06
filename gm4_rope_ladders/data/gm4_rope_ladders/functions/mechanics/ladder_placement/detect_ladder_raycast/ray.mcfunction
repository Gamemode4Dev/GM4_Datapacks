# raycast from the players head that moves forward until it finds a ladder block
# @s = player that interacts with a "right click detection" villager while holding ladder
# at @s anchored eyes, moving forward
# run from function: gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/init

# detect if player sees ladder
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 run function gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/found

# loop
scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..4 unless score $ladder_found gm4_rol_data matches 1 positioned ^ ^ ^1 run function gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/ray
