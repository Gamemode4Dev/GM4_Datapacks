# Removes the haste effect from a player that is no longer using Cavaro.
# @s = a player who has used Cavaro previously but is no longer holding it
# at @s
# run from gm4_cavaro_shamir:player/check_tool_usage

# clear cavaro
effect clear @s haste
tag @s remove gm4_used_cavaro
