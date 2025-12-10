# @s = trader llama
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader,tag=gm4_balloon_animal_trader_new
# run from wandering_trader/trade/pick_animal

tp @s ~ 0 ~

data merge entity @s {Silent:1b,NoGravity:1b,Invulnerable:1b,ChestedHorse:1b,Variant:0,Strength:1,DespawnDelay:1,Tags:["gm4_trade_option"],Items:[{id:"minecraft:emerald",count:2,Slot:1b}],equipment:{body:{id:"minecraft:light_blue_carpet",count:1b,components:{"minecraft:custom_data":{gm4_trades:{options:{maxUses:4,rewardXp:1b,xp:1,priceMultiplier:0.05f}}}}}}}


execute store result score $variant_id gm4_balloon_animals_data run random value 0..2

for index, egg_variant in enumerate(ctx.meta['chicken_eggs']):
    execute if score $variant_id gm4_balloon_animals_data matches index run loot replace entity @s horse.0 loot f"gm4_balloon_animals:chicken_egg/{egg_variant}"
