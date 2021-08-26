# run from TODO

# register trade
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_gv_decorative_trade_option","gm4_new_trade_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:green_carpet",Count:1b,tag:{gm4_garden_variety:{trade_data:{maxUses:1,rewardXp:1b,xp:10,priceMultiplier:0.1f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_garden_variety_trees:arborist_trades/decorative_tree_saplings
tag @e[type=trader_llama] remove gm4_new_trade_option
