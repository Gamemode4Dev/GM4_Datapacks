# Raycasts to the door that was clicked by the player.
# @s = a player who has clicked a door and is not sneaking
# at @s of the player
# run from advancement gm4_double_doors:use_door

# revoke advancement
advancement revoke @s only gm4_double_doors:use_door
title @a actionbar "Door Click Detected"
# raycast
scoreboard players set $ray gm4_double_doors_data 50
scoreboard players set $found gm4_double_doors_data 0
execute anchored eyes positioned ^ ^ ^ run function gm4_double_doors:player/ray
