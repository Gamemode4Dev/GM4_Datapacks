# run from TODO

# change level
data modify entity @s VillagerData.level set value 3

# change level tag
tag @s remove gm4_gv_level_2
tag @s add gm4_gv_level_3

# [Trade] sell_natural_saplings
scoreboard players set $trade_amount gm4_gv_trades 2
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_natural_saplings

# [Trade] sell_decorative_saplings
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_decorative_saplings
