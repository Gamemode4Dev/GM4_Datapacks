# finds custom gm4 potions
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from gm4_potion_tracking-1.0:resolve_tick

# execute as all potions
execute as @e[type=potion] run function gm4_potion_tracking:potion
