# Harvests beetroot and tries to replant it
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/beetroots

# destroy crop
setblock ~ ~ ~ air destroy

# item magnet
function gm4_pig_tractors:utility/item_magnet

# try to replant beetroot if the player isn't holding a seed
scoreboard players set $planted_successfully gm4_pig_tractors 0
execute unless predicate gm4_pig_tractors:player/equipment/holding_seeds run function gm4_pig_tractors:plant/item/beetroot_seeds

# plant other crop if beetroot seed planting failed
execute if score $planted_successfully gm4_pig_tractors matches 0 run function gm4_pig_tractors:plant/select_type
