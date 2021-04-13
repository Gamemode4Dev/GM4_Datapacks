# Applies a tilling action to dirt
# @s = player on a pig tractor
# at block being tilled
# run from gm4_pig_tractors:till/select_type

# place new block
setblock ~ ~ ~ farmland[moisture=7] replace

# sound
playsound minecraft:item.hoe.till player @s ~ ~ ~ 0.8 1
