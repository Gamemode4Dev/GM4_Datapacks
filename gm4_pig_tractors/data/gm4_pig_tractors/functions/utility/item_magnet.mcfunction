# Teleports nearby items to the player
# @s = player on a pig tractor that has just harvested somthing
# at @s
# run from functions in gm4_pig_tractors:harvest/block/ and gm4_pig_tractors:till/block/

# search items
tag @e[type=item,distance=..3] add gm4_pig_tractors_item

# decrease pickup delay
execute as @e[type=item,tag=gm4_pig_tractors_item] run data modify entity @s PickupDelay set value 0

# teleport items
tp @e[type=item,tag=gm4_pig_tractors_item] @s

# detag
tag @e[type=item] remove gm4_pig_tractors_item
