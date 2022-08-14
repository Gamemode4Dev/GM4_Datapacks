# Adds trades to be added to wandering traders. The base randomly will select one trade from each trade pool to be added to a wandering trader.
# @s = a wandering trader
# at @s
# called via function tag #gm4_trades:register_trades
# NOTE: this will only run if #gm4_trades:register_trades is changed to have this function in the "values" instead of in "_example_values"

# a trade option with hardcoded buy, buyB, sell and options. The 'pool' tag is omitted, resulting in an unnamed pool. Therefore this trade will always be listed as its own option, and other packs can not add items to this trade pool.
# Items[{Slot:2b}] is used for the item being sold (by the wandering trader), Items[{Slot:3b}] for the item being bought (by the wandering trader) and Items[{Slot:4b}] for the secondary buy item.
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:grass_block",Count:1b,Slot:2b},{id:"minecraft:emerald",Count:1b,Slot:3b},{id:"minecraft:wheat_seeds",Count:1b,Slot:4b}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}

# another hardcoded trade as in line 7, but this one only appears for traders in the end
execute if predicate gm4_trades_example:the_end run summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:end_stone",Count:1b,Slot:2b},{id:"minecraft:emerald",Count:1b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{pool:"gm4_trades_example:foo_trades",options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}

# a trade in the trade pool "gm4_trades_example:foo_trades"
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:spawner",Count:1b,Slot:2b},{id:"minecraft:emerald",Count:64b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{pool:"gm4_trades_example:foo_trades",options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}

# a trade that uses a loot table for the sell and the buy option
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:24,rewardXp:0b}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_trades_example:blocks
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.1 loot gm4_trades_example:shinies
tag @e[type=trader_llama] remove gm4_new_trade_option

# another trade in the trade pool "gm4_trades_example:foo_trades"
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{},{id:"minecraft:rotten_flesh",Count:1b,Slot:4b}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{pool:"gm4_trades_example:foo_trades",options:{maxUses:1,rewardXp:1b,xp:24,priceMultiplier:0.1f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_trades_example:spawn_eggs
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.1 loot gm4_trades_example:shinies
tag @e[type=trader_llama] remove gm4_new_trade_option

# a trade in the trade pool "gm4_trades_example:bar_trades"
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:slime_block",Count:1b,Slot:2b},{id:"minecraft:emerald",Count:1b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{pool:"gm4_trades_example:bar_trades",options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}

# a trade in the trade pool "gm4_trades_example:bar_trades", that uses one loot table to populate the entire trade
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:2,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_trades_example:pickaxe_trade
tag @e[type=trader_llama] remove gm4_new_trade_option
