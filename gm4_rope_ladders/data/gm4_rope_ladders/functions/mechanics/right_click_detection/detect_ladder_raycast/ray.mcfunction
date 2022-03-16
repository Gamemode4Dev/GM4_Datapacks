# raycasts from the players head that moves forward until it finds a ladder block
# @s = player holding ladder
# at @s anchored eyes, moving forward
# run from function: gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/init

# detect if player sees ladder
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 if block ~ ~-1 ~ #gm4_rope_ladders:valid_replace run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found
execute if block ~ ~ ~ ladder align xyz positioned ~.5 ~ ~.5 unless block ~ ~1 ~ ladder run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found

# loop
scoreboard players add $ray gm4_rol_data 1
execute if score $ray gm4_rol_data matches 0..5 unless score $found_ladder gm4_rol_data matches 1 positioned ^ ^ ^.5 run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/ray
