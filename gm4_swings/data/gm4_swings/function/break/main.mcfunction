# particle
data modify storage gm4_swings:temp item_model set from entity @s item.components."minecraft:item_model"
function gm4_swings:break/particle with storage gm4_swings:temp

# sooound
playsound minecraft:item.lead.break block @a ~ ~ ~ 0.5 1.5
playsound minecraft:block.bamboo_wood.break block @a ~ ~ ~ 1 1

# item
data modify storage gm4_swings:temp type set from entity @s item.components."minecraft:custom_data".gm4_swings.type
function gm4_swings:break/item with storage gm4_swings:temp

# kill the swing
function gm4_swings:swing/kill
