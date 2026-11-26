# Harvests carrots and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/carrots

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant carrot if the player isn't holding a seed
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:carrot run return run function gm4_pig_tractors:plant/block/carrot

# plant other crop if carrot planting failed
function gm4_pig_tractors:plant/plant_seed
