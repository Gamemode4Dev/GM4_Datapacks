# build a trade from trade_data
# @s = furniture station villager
# at @s
# run from technical/furniture_station/build_trades/prep
# run from here

data modify storage gm4_furniture:temp new_trade set value {rewardExp:0b,maxUses:2147483647,uses:0,xp:0,buy:{id:"minecraft:barrier",count:1},buyB:{id:"minecraft:barrier",count:1},sell:{id:"minecraft:barrier",count:1}}
data modify storage gm4_furniture:temp new_trade.buy.id set from storage gm4_furniture:temp trade_data[0].cost[0].id
data modify storage gm4_furniture:temp new_trade.buy.count set from storage gm4_furniture:temp trade_data[0].cost[0].count

execute store result score $second_trade_count gm4_furniture_data run data get storage gm4_furniture:temp trade_data[0].cost[1].count
execute unless score $second_trade_count gm4_furniture_data matches 1.. run data remove storage gm4_furniture:temp new_trade.buyB
execute if score $second_trade_count gm4_furniture_data matches 1.. run data modify storage gm4_furniture:temp new_trade.buyB.id set from storage gm4_furniture:temp trade_data[0].cost[1].id
execute if score $second_trade_count gm4_furniture_data matches 1.. run data modify storage gm4_furniture:temp new_trade.buyB.count set from storage gm4_furniture:temp trade_data[0].cost[1].count

function gm4_furniture:technical/furniture_station/build_trades/resolve_trade with storage gm4_furniture:temp trade_data[0].result
data modify storage gm4_furniture:temp new_trade.sell set from block 29999998 1 7134 Items[{Slot:0b}]
data modify storage gm4_furniture:temp new_trade.sell.count set from storage gm4_furniture:temp trade_data[0].result.count

data modify storage gm4_furniture:temp trades append from storage gm4_furniture:temp new_trade
data remove storage gm4_furniture:temp new_trade

data remove storage gm4_furniture:temp trade_data[0]
execute if data storage gm4_furniture:temp trade_data[0] run function gm4_furniture:technical/furniture_station/build_trades/build_trade
