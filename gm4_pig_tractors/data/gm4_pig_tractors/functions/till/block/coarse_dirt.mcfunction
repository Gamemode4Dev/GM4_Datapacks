# Applies a tilling action to coarse_dirt
# @s = player on a pig tractor
# at block being tilled
# run from gm4_pig_tractors:till/select_type

# place new block
setblock ~ ~ ~ farmland[moisture=7] replace

# chance to spawn additional loot
loot spawn ~ ~1 ~ loot gm4_pig_tractors:till/coarse_dirt

# item magnet
function gm4_pig_tractors:utility/item_magnet

# sound
playsound minecraft:item.hoe.till player @s ~ ~ ~ 0.8 1
