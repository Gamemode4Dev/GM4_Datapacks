# Removes a block drop
# @s = group of items around closest item within 5 blocks of player with Age:0s
# at @s
# run from gm4_cavaro_shamir:player/break_block

# remove item
kill @s

# particle
particle smoke ~ ~ ~ 0 0 0 0.01 1
playsound block.lava.pop block @s ~ ~ ~ 0.8 0.2 0
