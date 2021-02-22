# adds trades from storage into wandering traders
# @s = a wandering trader without the gm4_fruiting_trader tag (aka without the new trades)
# at @s
# run from gm4_fruiting_trees:main

# generate trades
function #gm4_fruiting_trees:wandering_trader/register_trade

# select random trade
data modify storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data set from entity @e[type=armor_stand,tag=gm4_fruiting_trader_trade_option,limit=1,sort=random] {}

# interpret trade data (ArmorItems[0]: metadata; HandItems[0]: buy; HandItems[1]: buyB; ArmorItems[3]: sell)
data modify storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade set from storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data.ArmorItems[0].tag.gm4_fruiting_trees.trade_options
data modify storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade.buy set from storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data.HandItems[0]
data modify storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade.buyB set from storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data.HandItems[1]
data modify storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade.sell set from storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data.ArmorItems[3]
kill @e[type=armor_stand,tag=gm4_fruiting_trader_trade_option]
data remove storage gm4_fruiting_trees:temp/wandering_trader/unprocessed_trade_data armor_stand_data

# add trade
data modify entity @s Offers.Recipes append from storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade
data remove storage gm4_fruiting_trees:temp/wandering_trader/next_trade trade

# remember
tag @s add gm4_fruiting_trader
