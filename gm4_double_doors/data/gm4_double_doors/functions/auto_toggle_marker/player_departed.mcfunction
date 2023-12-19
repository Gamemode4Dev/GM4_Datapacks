# changes the state of an auto toggle marker from player_present to player_departed
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run from gm4_double_doors:auto_toggle_marker/maintain

# update state
scoreboard players set @s gm4_double_doors_auto_toggle_state 2

# skip lifetime forwards
scoreboard players set @s gm4_double_doors_auto_toggle_liftime 10
