# @s = wandering trader
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader
# run from wandering_trader/trade/pick_animal

data modify storage gm4_balloon_animals:temp trade set value {buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:bee_nest",components:{"minecraft:bees":[{entity_data:{id:"minecraft:bee"},ticks_in_hive:0,min_ticks_in_hive:0}]}},maxUses:1,rewardExp:1b,xp:1,priceMultiplier:0.05f}
