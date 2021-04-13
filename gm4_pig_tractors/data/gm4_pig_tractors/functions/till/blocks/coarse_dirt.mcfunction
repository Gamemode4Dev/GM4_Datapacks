# Applies a tilling action to coarse_dirt
# @s = player on a pig tractor
# at block being tilled
# run from gm4_pig_tractors:till/select_type

# place new block
setblock ~ ~ ~ dirt replace

# sound
playsound minecraft:item.hoe.till player @s ~ ~ ~ 0.8 1
