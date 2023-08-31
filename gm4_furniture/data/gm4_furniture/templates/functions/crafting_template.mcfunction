# this is a test


data modify storage gm4_furniture:temp new_trades.test1 set value {cmd:3420201,trades:[]}
data modify storage gm4_furniture:temp new_trades.test2 set value {cmd:3420202,trades:[]}
data modify storage gm4_furniture:temp new_trades.test3 set value {cmd:3420202,trades:[]}

{{ furniture_list }}

data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades.test1
data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades.test2
data modify storage gm4_furniture:data furniture_station append from storage gm4_furniture:temp new_trades.test3
data remove storage gm4_furniture:temp new_trades
