# gives the villager level 2 trades
# @s = @s[tag=gm4_gv_arborist]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/process


# change level
data modify entity @s VillagerData.level set value 2

# change level tag
tag @s remove gm4_gv_level_1
tag @s add gm4_gv_level_2

# [Trade] sell_tools
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_tools

# [Trade] sell_soil
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_soil

# [Trade] sell_leaves
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_leaves

# [Trade] sell_decor
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_decor

# clear left over nbt
data modify entity @s ArmorItems set value []
