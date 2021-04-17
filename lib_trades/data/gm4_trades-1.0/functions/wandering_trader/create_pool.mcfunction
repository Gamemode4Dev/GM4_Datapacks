# opens a new trade pool
# @s = a wandering trader without the gm4_trader tag (aka without the new trades)
# at position of wandering trader
# run from gm4_trades-1.0:wandering_trader/modify

# start pooling at an unpooled option
execute as @e[type=trader_llama,tag=gm4_trade_option,limit=1,sort=arbitrary] run function gm4_trades-1.0:wandering_trader/pool/initialize

# add pooled trades to trader
function gm4_trades-1.0:wandering_trader/append_trade
