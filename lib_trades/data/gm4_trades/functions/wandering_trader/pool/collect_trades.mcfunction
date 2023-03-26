# compares all trade options against this pools name and marks matching ones as belonging to this pool
# @s = the next trade option in line
# at position of wandering trader
# run from gm4_trades:wandering_trader/pool/initialize, loops itself

# remember this option was processed
tag @s add gm4_processed_trade_option

# compare current fixed pool id to pool id of next unprocessed trade option ($pools_differ == 1 if next trade does not exist or is in different trade pool ;;; == 0 if pool names match)
scoreboard players set $pools_differ gm4_trades_data 1
data modify storage gm4_trades:temp/wandering_trader/comparison pool set from storage gm4_trades:temp/wandering_trader/current_tradepool pool
execute if data entity @s DecorItem.tag.gm4_trades.pool store success score $pools_differ gm4_trades_data run data modify storage gm4_trades:temp/wandering_trader/comparison pool set from entity @s DecorItem.tag.gm4_trades.pool
data remove storage gm4_trades:temp/wandering_trader/comparison pool

# if trade pools didnt differ, keep looping until they do.
execute if score $pools_differ gm4_trades_data matches 0 run tag @s add gm4_pooled_trade_option
execute as @e[type=trader_llama,tag=gm4_trade_option,tag=!gm4_processed_trade_option,limit=1,sort=arbitrary] run function gm4_trades:wandering_trader/pool/collect_trades
