# gives the villager level 2 trades
# @s = @s[tag=gm4_gv_arborist]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/process


# change level
data modify entity @s VillagerData.level set value 4

# change level tag
tag @s remove gm4_gv_level_3
tag @s add gm4_gv_level_4

# [Trade] sell_decorative_saplings
scoreboard players set $trade_amount gm4_gv_trades 2
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_decorative_saplings

# [Trade] sell_natural_saplings
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_natural_saplings
