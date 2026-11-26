# Decides what to do when tilling a block
# @s = player on a pig tractor
# at the player
# run from advancement gm4_pig_tractors:till_block

# revoke
advancement revoke @s only gm4_pig_tractors:till_block

# destroy top block (this is a replaceable block, by function call)
setblock ~ ~ ~ air destroy

# chance to spawn additional loot
loot spawn ~ ~ ~ loot gm4_pig_tractors:till_block

# place new block
setblock ~ ~-1 ~ farmland[moisture=7] replace

# item magnet
function gm4_pig_tractors:utility/item_magnet

# sound
playsound minecraft:item.hoe.till player @s ~ ~ ~ 0.8 1

# try to plant seed
function gm4_pig_tractors:plant/plant_seed

# award advancement
advancement grant @s only gm4:pig_tractors
