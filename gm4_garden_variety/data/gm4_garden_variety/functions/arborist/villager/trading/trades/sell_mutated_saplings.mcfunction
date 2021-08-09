# run from TODO


# reset storage
data remove storage gm4_garden_variety:data/arborist next_trade
data remove storage gm4_garden_variety:data/arborist random_trade

# register trades
function #gm4_garden_variety:arborist/register_trades/mutated_tree_sapling

# select random trade
data modify storage gm4_garden_variety:data/arborist random_trade set from entity @e[type=trader_llama,tag=gm4_gv_mutated_trade_option,limit=1,sort=random] {}

# interpret trade data (DecorItem: trade_data, Items[0]: sell, Items[1]: buy, Items[2]: buyB)
data modify storage gm4_garden_variety:data/arborist next_trade set from storage gm4_garden_variety:data/arborist random_trade.DecorItem.tag.gm4_garden_variety.trade_data
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from storage gm4_garden_variety:data/arborist random_trade.Items[0]
data modify storage gm4_garden_variety:data/arborist next_trade.buy set from storage gm4_garden_variety:data/arborist random_trade.Items[1]
data modify storage gm4_garden_variety:data/arborist next_trade.buyB set from storage gm4_garden_variety:data/arborist random_trade.Items[2]

# add random mutation
function gm4_garden_variety:data/generate/random_mutation
data modify storage gm4_garden_variety:data/arborist next_trade.sell.tag.gm4_garden_variety.traits set from storage gm4_garden_variety:data/mutation random_mutation

# modify lore
data modify storage gm4_garden_variety:data/arborist next_trade.sell.tag.display.Lore[0] set value '{"italic":true,"color":"gray","text":"A mutated sapling bought from the arborist"}'

# store trades into nbt
data modify entity @s Offers.Recipes append from storage gm4_garden_variety:data/arborist next_trade

# update debug storage
data modify storage gm4_garden_variety:debug/arborist trades.sell_mutated_saplings append from storage gm4_garden_variety:data/arborist next_trade.sell.id

# loop
scoreboard players remove $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/sell_mutated_saplings