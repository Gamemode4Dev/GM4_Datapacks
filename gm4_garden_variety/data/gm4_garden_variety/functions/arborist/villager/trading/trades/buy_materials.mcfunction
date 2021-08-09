# run from TODO



### initialize ###

# reset storage
data remove storage gm4_garden_variety:data/arborist next_trade


### sell ###

# set trade item
loot replace entity @s weapon loot gm4_garden_variety:arborist/trades/buy_materials/sell
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]

### buy ###

# set trade item
loot replace entity @s weapon loot gm4_garden_variety:arborist/trades/buy_materials/buy
data modify storage gm4_garden_variety:data/arborist next_trade.buy set from entity @s HandItems[0]


### finalize ###

# set other trade data
data modify storage gm4_garden_variety:data/arborist next_trade.xp set value 2
data modify storage gm4_garden_variety:data/arborist next_trade.maxUses set value 16
data modify storage gm4_garden_variety:data/arborist next_trade.priceMultiplier set value 0.1f

# store trades into 
data modify entity @s Offers.Recipes append from storage gm4_garden_variety:data/arborist next_trade

# update debug storage
data modify storage gm4_garden_variety:debug/arborist trades.level_1.buy_materials append from storage gm4_garden_variety:data/arborist next_trade.buy.id

# loop
scoreboard players remove $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/buy_materials