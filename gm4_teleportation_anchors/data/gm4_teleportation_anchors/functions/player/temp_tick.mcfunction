# @s = none
# located at world spawn
# run from player/jam_player

execute as @e[tag=gm4_ta_track_movement] run function gm4_teleportation_anchors:player/track_movement
execute as @e[tag=gm4_ta_store_pos] at @s run function gm4_teleportation_anchors:player/store_position

# keep ticking if there are players with the tag
execute if entity @e[tag=gm4_ta_teleported_player] run schedule function gm4_teleportation_anchors:player/temp_tick 1t
