# Adds trades to be added to wandering traders via lib_trades
# @s = a wandering trader
# at @s
# called via function tag #gm4_trades:register_trades

summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{pool:"gm4_zauber_cauldrons:precursors",options:{maxUses:4,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_zauber_cauldrons:wandering_trader/enchanted_prismarine_shard
tag @e[type=trader_llama] remove gm4_new_trade_option
