# @s = nearby item
# at the player
# run from utility/item_magnet

# decrease pickup delay
data modify entity @s PickupDelay set value 0

# teleport item to player
tp @e[type=item,tag=gm4_pig_tractors_item] ~ ~ ~
