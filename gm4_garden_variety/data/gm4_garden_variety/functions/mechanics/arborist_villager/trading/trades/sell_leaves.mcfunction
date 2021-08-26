# run from TODO



### initialize ###

# reset storage
data remove storage gm4_garden_variety:data/arborist next_trade


### sell ###

# set trade item
loot replace entity @s weapon loot gm4_garden_variety:arborist/trades/sell_leaves/sell
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]


### buy ###

# set trade item
loot replace entity @s weapon loot gm4_garden_variety:arborist/trades/sell_leaves/buy
data modify storage gm4_garden_variety:data/arborist next_trade.buy set from entity @s HandItems[0]


### finalize ###

# set other trade data
data modify storage gm4_garden_variety:data/arborist next_trade.xp set value 5
data modify storage gm4_garden_variety:data/arborist next_trade.maxUses set value 8
data modify storage gm4_garden_variety:data/arborist next_trade.priceMultiplier set value 0.1f

# store trades into nbt
data modify entity @s Offers.Recipes append from storage gm4_garden_variety:data/arborist next_trade

# update debug storage
data modify storage gm4_garden_variety:debug/arborist trades.level_2.sell_blocks append from storage gm4_garden_variety:data/arborist next_trade.sell.id

# loop
scoreboard players remove $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_blocks