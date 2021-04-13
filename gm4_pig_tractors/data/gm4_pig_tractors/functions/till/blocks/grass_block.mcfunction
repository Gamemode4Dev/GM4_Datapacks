# Applies a tilling action to grass_block
# @s = player on a pig tractor
# at block being tilled
# run from gm4_pig_tractors:till/select_type

# place new block
setblock ~ ~ ~ farmland[moisture=7] replace

# chance to spawn additional loot
loot spawn ~ ~1 ~ loot gm4_pig_tractors:till/grass_block

# sound
playsound minecraft:item.hoe.till player @s ~ ~ ~ 0.8 1

