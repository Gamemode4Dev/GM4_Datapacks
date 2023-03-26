# initializes the newly created pool with a pool name
# @s = the first trade option in the pool (arbitrary sorting)
# at position of wandering trader
# run from gm4_trades:wandering_trader/create_pool

# mark trade option as pooled and processed, to prevent self comparison
tag @s add gm4_pooled_trade_option
tag @s add gm4_processed_trade_option

# read current trade pool name space
data modify storage gm4_trades:temp/wandering_trader/current_tradepool pool set from entity @s DecorItem.tag.gm4_trades.pool

# compare to next trade option's pool
execute as @e[type=trader_llama,tag=gm4_trade_option,tag=!gm4_pooled_trade_option,limit=1,sort=arbitrary] run function gm4_trades:wandering_trader/pool/collect_trades

# clean up tag and storage (tag cleanup is very important here!)
tag @e[type=trader_llama,tag=gm4_trade_option] remove gm4_processed_trade_option
data remove storage gm4_trades:temp/wandering_trader/current_tradepool pool
