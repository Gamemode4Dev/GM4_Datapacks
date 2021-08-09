# run from TODO

# change level
data modify entity @s VillagerData.level set value 5

# change level tag
tag @s remove gm4_gv_level_4
tag @s add gm4_gv_level_5

# [Trade] sell_mutated_saplings
scoreboard players set $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:arborist/villager/trading/trades/sell_mutated_saplings

# clear left over nbt
data modify entity @s ArmorItems set value []
