# Harvests beetroot and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/beetroots

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant beetroot if the player has beetroot seeds
execute if items entity @s gm4_pig_tractors:player_inventory minecraft:beetroot_seeds run return run function gm4_pig_tractors:plant/block/beetroot_seeds

# plant other crop if beetroot planting failed
function gm4_pig_tractors:plant/plant_seed
