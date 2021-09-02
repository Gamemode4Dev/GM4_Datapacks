# run from TODO


# register trades
function #gm4_garden_variety:mechanics/arborist_villager/register_trades/mutated_tree_sapling

# select random trade
data modify storage gm4_garden_variety:dev Item set from entity @e[type=trader_llama,tag=gm4_gv_mutated_trade_option,limit=1,sort=random] Items[0]

# kill trade markers
kill @e[tag=gm4_gv_mutated_trade_option]

# add random mutation
function gm4_garden_variety:data/generate/random_mutation
data modify storage gm4_garden_variety:dev Item.tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:generate/mutation output
function gm4_garden_variety:data/generate/random_mutation
data modify storage gm4_garden_variety:dev Item.tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:generate/mutation output
function gm4_garden_variety:data/generate/random_mutation
data modify storage gm4_garden_variety:dev Item.tag.gm4_garden_variety.mutations append from storage gm4_garden_variety:generate/mutation output

# summon item
summon item ~ ~ ~ {PickupDelay:1,Tags:["gm4_gv_test_item"],Item:{id:"minecraft:oak_sapling",Count:1b}}

# replace item
data modify entity @e[tag=gm4_gv_test_item,limit=1] Item set from storage gm4_garden_variety:dev Item

# remove tag
tag @e[tag=gm4_gv_test_item] remove gm4_gv_test_item
