# Starts the Cavato block breaking process.
# @s = player who has used Cavaro to break a block
# at @s
# run from gm4_cavaro_shamir:player/check_tool_usage

# set flag
tag @s add gm4_used_cavaro

# gain haste
effect give @s haste 3 1 false

# look for dropped item
execute as @e[type=item,limit=1,distance=..8,sort=nearest,nbt={Age:0s}] at @s run function gm4_cavaro_shamir:block_drop/find
