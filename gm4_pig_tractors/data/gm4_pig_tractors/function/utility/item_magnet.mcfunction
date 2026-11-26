# Teleports nearby items to the player
# @s = player on a pig tractor that has just harvested somthing
# at @s
# run from functions in gm4_pig_tractors:harvest/block/ and gm4_pig_tractors:till/block/

# find nearby items
execute as @e[type=item,distance=..3] run function gm4_pig_tractors:utility/teleport_item
