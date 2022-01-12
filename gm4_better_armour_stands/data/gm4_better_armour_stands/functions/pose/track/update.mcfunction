# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from tick

# keep wandering_trader in front of player
execute as @e[type=wandering_trader,tag=gm4_bas_detect] if score @s gm4_bas_id = $current gm4_bas_id positioned ~ ~-1 ~ run tp @s ^ ^ ^.5

# move offset marker, rotate joint marker facing offset marker, and update rotation scores
execute as @e[type=marker,tag=gm4_bas_player_offset] if score @s gm4_bas_id = $current gm4_bas_id run function gm4_better_armour_stands:pose/track/update_markers

# update armor_stand part pose
execute if score @s gm4_bas_mode matches 1..6 run function gm4_better_armour_stands:pose/track/update_pose

# update for move/rotate
execute if score @s gm4_bas_mode matches 7 run function gm4_better_armour_stands:pose/track/move
execute if score @s gm4_bas_mode matches 8 run function gm4_better_armour_stands:pose/track/rotate
