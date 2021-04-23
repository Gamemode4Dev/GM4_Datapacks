# Harvests carrots and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/carrots

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant carrot if the player isn't holding a seed
scoreboard players set $planted_successfully gm4_pig_tractors 0
execute unless predicate gm4_pig_tractors:player/equipment/holding_seeds run function gm4_pig_tractors:plant/item/carrot

# plant other crop if carrot planting failed
execute if score $planted_successfully gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/select_type
