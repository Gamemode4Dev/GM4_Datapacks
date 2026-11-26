# Harvests potato and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/potatoes

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant potato if the player isn't holding a seed
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:potato run return run function gm4_pig_tractors:plant/block/potato

# plant other crop if potato planting failed
function gm4_pig_tractors:plant/plant_seed
