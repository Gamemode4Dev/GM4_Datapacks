# run from TODO

# change level
data modify entity @s VillagerData.level set value 2

# change level tag
tag @s remove gm4_gv_level_1
tag @s add gm4_gv_level_2

# [Trade] sell_tools
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/sell_tools

# [Trade] sell_soil OR sell_leaves (1)
loot replace entity @s weapon loot gm4_garden_variety:arborist/choose_trades/sell_soil_vs_sell_leaves
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_soil"}'} as @s run function gm4_garden_variety:arborist/villager/trading/trades/sell_soil
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_leaves"}'} as @s run function gm4_garden_variety:arborist/villager/trading/trades/sell_leaves

# [Trade] sell_soil OR sell_leaves (2)
loot replace entity @s weapon loot gm4_garden_variety:arborist/choose_trades/sell_soil_vs_sell_leaves
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_soil"}'} as @s run function gm4_garden_variety:arborist/villager/trading/trades/sell_soil
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_leaves"}'} as @s run function gm4_garden_variety:arborist/villager/trading/trades/sell_leaves

# [Trade] sell_decor
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/sell_decor

# clear left over nbt
data modify entity @s ArmorItems set value []
