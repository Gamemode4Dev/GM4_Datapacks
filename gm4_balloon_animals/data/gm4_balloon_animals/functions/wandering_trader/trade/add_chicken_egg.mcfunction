# Set up chicken egg trade for the balloon animal trader
# @s =  a wandering trader without the gm4_calling_bell_trader tag (aka naturally spawned trader) with exactly 2 trader llamas
# at @s
# run from gm4_balloon_animal:wandering_trader/animal_(one or two)/choose_(common or rare)

summon trader_llama ~ 0 ~ {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option","gm4_new_trade_option"],Items:[{},{id:"minecraft:emerald",Count:2b,Slot:3b},{}],DecorItem:{id:"minecraft:light_blue_carpet",Count:1b,tag:{gm4_trades:{options:{maxUses:4,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}

loot replace entity @e[type=trader_llama,limit=1,tag=gm4_new_trade_option] horse.0 loot gm4_balloon_animals:chicken_egg

tag @e[type=trader_llama] remove gm4_new_trade_option