
# reset scoreboard
scoreboard players set $found_ladder gm4_rol_data 0

# detect if ladder is in front of player
scoreboard players set $ray gm4_rol_data 0 
execute anchored eyes run function gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/ray

