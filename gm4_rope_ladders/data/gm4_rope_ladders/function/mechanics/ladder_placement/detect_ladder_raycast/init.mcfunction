# begins a raycast from the players head that moves forward until it finds a ladder block
# @s = player that interacts with a "right click detection" villager while holding ladder
# at @s
# run from function: gm4_rope_ladders:mechanics/ladder_placement/interact_right_click_detection

# reset scoreboard
scoreboard players set $ladder_placed gm4_rol_data 0
scoreboard players set $ladder_found gm4_rol_data 0

# detect if ladder is in front of player
scoreboard players set $ray gm4_rol_data 0 
execute anchored eyes run function gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/ray

