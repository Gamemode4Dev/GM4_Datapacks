# @s = trader llama
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader,tag=gm4_balloon_animal_trader_new
# run from wandering_trader/trade/init_[animal|wolf|farm]

tp @s ~ 0 ~
data merge entity @s {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:emerald",count:12,Slot:1b}],equipment:{body:{id:"minecraft:light_blue_carpet",count:1,components:{"minecraft:custom_data":{gm4_trades:{options:{maxUses:1,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}}}

loot replace entity @s horse.0 loot gm4_balloon_animals:lead

data modify storage gm4_balloon_animals:temp CustomName set from entity @s Items[0].components."minecraft:lore"[0].text
