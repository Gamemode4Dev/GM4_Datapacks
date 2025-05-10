# adds trades from storage into wandering traders
# @s = a wandering trader without the gm4_trader tag (aka without the new trades)
# at @s
# run from gm4_trades:wandering_trader/create_pool

# select random trade
data modify storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data set from entity @e[type=trader_llama,tag=gm4_pooled_trade_option,limit=1,sort=random] {}

# interpret trade data (equipment.body: metadata; Items[{Slot:0b}]: sell; Items[{Slot:1b}]: buy; Items[{Slot:2b}]: buyB)
data modify storage gm4_trades:temp/wandering_trader/next_trade trade set from storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data.equipment.body.components."minecraft:custom_data".gm4_trades.options
data modify storage gm4_trades:temp/wandering_trader/next_trade trade.sell set from storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data.Items[{Slot:0b}]
data modify storage gm4_trades:temp/wandering_trader/next_trade trade.buy set from storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data.Items[{Slot:1b}]
data modify storage gm4_trades:temp/wandering_trader/next_trade trade.buyB set from storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data.Items[{Slot:2b}]

# kill llama without drops and clean up loot table
execute as @e[type=trader_llama,tag=gm4_pooled_trade_option] run data merge entity @s {Health:0,DeathTime:19}
data remove storage gm4_trades:temp/wandering_trader/unprocessed_trade_data llama_data

# add trade
data modify entity @s Offers.Recipes append from storage gm4_trades:temp/wandering_trader/next_trade trade
data remove storage gm4_trades:temp/wandering_trader/next_trade trade

# try to create another pool if more trade options exists
scoreboard players reset $pools_differ gm4_trades_data
execute if entity @e[type=trader_llama,tag=gm4_trade_option,limit=1] run function gm4_trades:wandering_trader/create_pool
