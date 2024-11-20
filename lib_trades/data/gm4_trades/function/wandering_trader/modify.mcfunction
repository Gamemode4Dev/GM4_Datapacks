# collects trades added by various datapacks and adds them to the trader. Marks the trader as having received those trades.
# @s = a wandering trader without the gm4_trader tag (aka without the new trades)
# at @s
# scheduled from gm4_trades:main

# generate trades
function #gm4_trades:register_trades

# read-in trade pools
function gm4_trades:wandering_trader/create_pool

# remember trader was edited
tag @s add gm4_trader

# reset fake player
scoreboard players reset $pools_differ gm4_trades_data
