# finds custom gm4 potions
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from gm4_potion_tracking-1.0:resolve_tick

# allow modules to check if potions should be tracked
execute as @e[type=potion,tag=!gm4_potion_tracking_checked] run function gm4_potion_tracking-1.0:track/check_potion

# track custom potions
execute as @e[type=potion,tag=gm4_potion] at @s run function gm4_potion_tracking-1.0:track/potion
