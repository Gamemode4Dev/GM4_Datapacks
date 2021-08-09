# run from TODO


# reset storage
data remove storage gm4_garden_variety:data/arborist next_trade
data remove storage gm4_garden_variety:data/arborist random_trade

# register trades
function #gm4_garden_variety:arborist/register_trades/natural_tree_sapling

# select random trade
data modify storage gm4_garden_variety:data/arborist random_trade set from entity @e[type=trader_llama,tag=gm4_gv_natural_trade_option,limit=1,sort=random] {}

# kill trade markers
kill @e[tag=gm4_gv_natural_trade_option]

# interpret trade data (DecorItem: trade_data, Items[0]: sell, Items[1]: buy, Items[2]: buyB)
data modify storage gm4_garden_variety:data/arborist next_trade set from storage gm4_garden_variety:data/arborist random_trade.DecorItem.tag.gm4_garden_variety.trade_data
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from storage gm4_garden_variety:data/arborist random_trade.Items[0]
data modify storage gm4_garden_variety:data/arborist next_trade.buy set from storage gm4_garden_variety:data/arborist random_trade.Items[1]
data modify storage gm4_garden_variety:data/arborist next_trade.buyB set from storage gm4_garden_variety:data/arborist random_trade.Items[2]

# modify lore
data modify storage gm4_garden_variety:data/arborist next_trade.sell.tag.display.Lore[0] set value '{"italic":true,"color":"gray","text":"A wild sapling bought from the arborist"}'

# store trades into nbt
data modify entity @s Offers.Recipes insert 7 from storage gm4_garden_variety:data/arborist next_trade

# update debug storage
data modify storage gm4_garden_variety:debug/arborist trades.sell_natural_saplings append from storage gm4_garden_variety:data/arborist next_trade.sell.id

# loop
scoreboard players remove $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/sell_natural_saplings