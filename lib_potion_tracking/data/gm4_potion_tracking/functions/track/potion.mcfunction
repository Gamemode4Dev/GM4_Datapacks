# runs commands for all custom potions
# @s = custom gm4 potion (tag=gm4_potion)
# located at @s
# run from gm4_potion_tracking-1.0:potion

# initialize potions
execute unless score @s gm4_potion_id = @s gm4_potion_id run function gm4_potion_tracking:track/initialize_potion

# constantly teleport potion tracker marker to the potion
scoreboard players operation $current gm4_potion_id = @s gm4_potion_id
execute as @e[type=marker,tag=gm4_potion_tracker] if score @s gm4_potion_id = $current gm4_potion_id run tp ~ ~ ~

# schedule potion tracker detection
schedule function gm4_potion_tracking:track/check_marker 1t
