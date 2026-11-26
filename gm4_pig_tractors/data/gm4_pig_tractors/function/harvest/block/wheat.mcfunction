# Harvests wheat and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/wheat

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant wheat seeds if the player isn't holding a seed
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:wheat_seeds run return run function gm4_pig_tractors:plant/block/wheat_seeds

# plant other crop if wheat planting failed
function gm4_pig_tractors:plant/plant_seed
