# Adds trades from this expansion to the fruiting trees trade pool. The base randomly will select one trade from the trade pool to be added to a wandering trader.
# @s = a wandering trader without the gm4_fruiting_trader tag (aka without the new trades)
# located at @s
# run from gm4_fruiting_trees:wandering_trader/add_trade

# apple sapling
execute if predicate gm4_apple_trees:overworld run summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{id:"minecraft:emerald",Count:5b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_apple_trees:items/apple_tree_sapling
tag @e[type=trader_llama] remove gm4_new_trade_option
