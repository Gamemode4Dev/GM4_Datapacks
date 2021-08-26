# run from TODO

# change level
data modify entity @s VillagerData.level set value 1

# change level tag
tag @s add gm4_gv_level_1

# [Trade] sell_saplings OR buy_saplings
loot replace entity @s weapon loot gm4_garden_variety:arborist/choose_trades/sell_sapling_vs_buy_sapling
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_saplings"}'} as @s run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_saplings
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"buy_saplings"}'} as @s run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/buy_saplings

# [Trade] barter_saplings
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. as @s run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/barter_saplings

# [Trade] sell_food OR buy_materials
loot replace entity @s weapon loot gm4_garden_variety:arborist/choose_trades/buy_materials_vs_sell_food
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"sell_food"}'} as @s run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/sell_food
execute if score $trade_amount gm4_gv_trades matches 1.. if data entity @s HandItems[0].tag.display{Name:'{"text":"buy_materials"}'} as @s run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/buy_materials

# clear left over nbt
data modify entity @s ArmorItems set value []
