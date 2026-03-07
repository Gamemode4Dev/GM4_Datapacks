# loop through trade data to get the proper index in the frot
# @s = furniture station villager
# at @s
# run from technical/furniture_station/build_trades/prep
# run from here

data modify storage gm4_furniture:temp trade_data append from storage gm4_furniture:temp trade_data[0]
data remove storage gm4_furniture:temp trade_data[0]
scoreboard players remove $trade_index gm4_furniture_data 1
execute if score $trade_index gm4_furniture_data matches 1.. run function gm4_furniture:technical/furniture_station/build_trades/get_trade_data
