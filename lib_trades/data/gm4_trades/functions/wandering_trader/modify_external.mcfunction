# Hook-in point for other datapacks to add trades to a targeted villager-like mob. Trades must be loaded first (see README for more details).
# @s = a villager-like mob to receive trades
# at @s
# called by function tag gm4_trades:modify_external_trader

# read-in trade pools
function gm4_trades:wandering_trader/create_pool

# remember trader was edited
tag @s add gm4_trader

# reset fake player
scoreboard players reset $pools_differ gm4_trades_data
