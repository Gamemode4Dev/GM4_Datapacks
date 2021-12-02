# @s = Potion Cleric
# run from gm4_mob_curing:verify_dimension

# remove vanilla trades
data remove entity @s Offers.Recipes

# trade for slot 1 (nether wart for 4-7 emeralds)
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_0_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:8b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_0_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/trade_1

# trade for slot 2 (gunpowder for 3-5 emeralds)
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_1_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:8b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_1_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/trade_2

# trade for slot 3
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_2_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_2_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 4
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_3_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_3_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 5
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_4_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_4_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 6
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_5_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_5_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 7
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_6_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_6_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 8
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_7_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_7_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 9
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_8_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_8_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades

# trade for slot 10
summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_mob_curing_trade_9_option"],Items:[{},{},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:9999999,rewardXp:24b,xp:1,priceMultiplier:0.05f}}}}}
loot replace entity @e[type=trader_llama,limit=1,tag=gm4_mob_curing_trade_9_option] horse.0 loot gm4_mob_curing:technical/potion_cleric/all_trades
