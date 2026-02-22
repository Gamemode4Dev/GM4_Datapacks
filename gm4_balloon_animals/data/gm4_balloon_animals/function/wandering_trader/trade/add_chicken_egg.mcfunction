# @s = wandering trader
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader
# run from wandering_trader/trade/pick_animal

data modify storage gm4_balloon_animals:temp trade set value {buy:{id:"minecraft:emerald",count:2},maxUses:1,rewardExp:1b,xp:1,priceMultiplier:0.05f}

execute store result score $variant_id gm4_balloon_animals_data run random value 0..2
execute if score $variant_id gm4_balloon_animals_data matches 0 run data modify storage gm4_balloon_animals:temp trade.sell set value {id:"minecraft:egg",count:8}
execute if score $variant_id gm4_balloon_animals_data matches 1 run data modify storage gm4_balloon_animals:temp trade.sell set value {id:"minecraft:blue_egg",count:8}
execute if score $variant_id gm4_balloon_animals_data matches 2 run data modify storage gm4_balloon_animals:temp trade.sell set value {id:"minecraft:brown_egg",count:8}
