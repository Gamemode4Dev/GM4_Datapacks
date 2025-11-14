# raycasts from the players head that moves forward until it finds a ladder block
# @s = player holding ladder
# at @s anchored eyes, moving forward
# run from function: gm4_rope_ladders/data/gm4_rope_ladders/function/player/holding_ladder

# detect if player sees ladder
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 if block ~ ~-1 ~ #gm4:replaceable run return run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 unless block ~ ~1 ~ ladder run return run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found

# loop
scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..30 positioned ^ ^ ^.1 run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/ray
