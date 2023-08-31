# change the trades of this furniture station
# @s = furniture station wandering trader
# at @s
# run from interact/furniture_station/swap_tool
# run from place/furniture/furniture_station

# clamp index to min/max
execute if score @s gm4_furniture_index matches ..-1 run scoreboard players operation @s gm4_furniture_index = $max_index gm4_furniture_index
execute if score @s gm4_furniture_index > $max_index gm4_furniture_index run scoreboard players set @s gm4_furniture_index 0

# get the trade data that should be displayed in the first index
scoreboard players operation $trade_index gm4_furniture_data = @s gm4_furniture_index
data modify storage gm4_furniture:temp trade_data set from storage gm4_furniture:data furniture_station
execute if score $trade_index gm4_furniture_data matches 1.. run function gm4_furniture:technical/furniture_station/build_trades/get_trade_data

# change the displayed tools cmd
execute align xyz run data modify entity @e[type=item_display,tag=gm4_furniture.tool_main,dx=0,dy=0,dz=0,limit=1] item.tag.CustomModelData set from storage gm4_furniture:temp trade_data[0].cmd
execute align xyz run data modify entity @e[type=item_display,tag=gm4_furniture.tool_next,dx=0,dy=0,dz=0,limit=1] item.tag.CustomModelData set from storage gm4_furniture:temp trade_data[1].cmd
execute align xyz run data modify entity @e[type=item_display,tag=gm4_furniture.tool_prev,dx=0,dy=0,dz=0,limit=1] item.tag.CustomModelData set from storage gm4_furniture:temp trade_data[-1].cmd

# build the trades from trade_data
data modify storage gm4_furniture:temp trade_data set from storage gm4_furniture:temp trade_data[0].trades
data modify storage gm4_furniture:temp trades set value []
function gm4_furniture:technical/furniture_station/build_trades/build_trade

# change the trades
data modify entity @s Offers.Recipes set from storage gm4_furniture:temp trades

# sounds
playsound ui.stonecutter.take_result block @a[distance=..16] ~ ~ ~ 1 0.45

# cleanup
data remove storage gm4_furniture:temp trades
data remove storage gm4_furniture:temp trade_data
