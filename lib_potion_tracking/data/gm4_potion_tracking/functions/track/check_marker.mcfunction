# checks potion_tracker markers 
# @s = none
# located at world spawn
# run from gm4_potion_tracking-1.0:track/potion

execute as @e[type=marker,tag=gm4_potion_tracker] at @s run function gm4_potion_tracking:track/marker
