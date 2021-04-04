# Adds trades from this expansion to the fruiting trees trade pool. The base randomly will select one trade from the trade pool to be added to a wandering trader.
# @s = a wandering trader without the gm4_fruiting_trader tag (aka without the new trades)
# at @s
# run from gm4_fruiting_trees:wandering_trader/add_trade

# summon armor stands with trade items from loot table

# apple sapling
execute if predicate gm4_apple_trees:overworld run summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:1b,Silent:1b,Tags:["gm4_trade_option","gm4_new_trade_option"],NoGravity:1b,HandItems:[{},{id:"minecraft:emerald",Count:5b}],ArmorItems:[{id:"minecraft:paper",Count:1b,tag:{gm4_trades:{pool:"gm4_apple_trees:apple_saplings",options:{maxUses:8,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}},{},{},{}]}
loot replace entity @e[type=minecraft:armor_stand,limit=1,tag=gm4_new_trade_option] weapon.mainhand loot gm4_apple_trees:items/apple_tree_sapling
tag @e[type=minecraft:armor_stand,distance=..2] remove gm4_new_trade_option
