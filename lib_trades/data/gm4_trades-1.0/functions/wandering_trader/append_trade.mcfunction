# adds trades from storage into wandering traders
# @s = a wandering trader without the gm4_trader tag (aka without the new trades)
# at @s
# run from gm4_trades-1.0:wandering_trader/create_pool

# select random trade
data modify storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data set from entity @e[type=armor_stand,tag=gm4_pooled_trade_option,limit=1,sort=random] {}

# interpret trade data (ArmorItems[0]: metadata; HandItems[0]: buy; HandItems[1]: buyB; ArmorItems[3]: sell)
data modify storage gm4_trades-1.0:temp/wandering_trader/next_trade trade set from storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data.ArmorItems[0].tag.gm4_trades.options
data modify storage gm4_trades-1.0:temp/wandering_trader/next_trade trade.buy set from storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data.HandItems[0]
data modify storage gm4_trades-1.0:temp/wandering_trader/next_trade trade.buyB set from storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data.HandItems[1]
data modify storage gm4_trades-1.0:temp/wandering_trader/next_trade trade.sell set from storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data.ArmorItems[3]
kill @e[type=armor_stand,tag=gm4_pooled_trade_option]
data remove storage gm4_trades-1.0:temp/wandering_trader/unprocessed_trade_data armor_stand_data

# add trade
data modify entity @s Offers.Recipes append from storage gm4_trades-1.0:temp/wandering_trader/next_trade trade
data remove storage gm4_trades-1.0:temp/wandering_trader/next_trade trade

# try to create another pool if more trade options exists
scoreboard players reset $pools_differ gm4_trades_data
execute if entity @e[type=armor_stand,tag=gm4_trade_option,limit=1] run function gm4_trades-1.0:wandering_trader/create_pool
