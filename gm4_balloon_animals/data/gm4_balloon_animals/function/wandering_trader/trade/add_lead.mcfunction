# @s = animal to be attached to trader
# at wandering trader with no llamas, tag=gm4_balloon_animal_trader
# run from wandering_trader/trade/init_[animal|wolf|farm]

data modify storage gm4_balloon_animals:temp trade set value {buy:{id:"minecraft:emerald",count:12},maxUses:1,rewardExp:1b,xp:1,priceMultiplier:0.05f}

loot spawn ~ -4096 ~ loot gm4_balloon_animals:lead
execute positioned ~ -4096 ~ run data modify storage gm4_balloon_animals:temp trade.sell set from entity @e[type=item,predicate=gm4_balloon_animals:is_lead,distance=..1,limit=1] Item
execute positioned ~ -4096 ~ run kill @e[type=item,predicate=gm4_balloon_animals:is_lead,distance=..1,limit=1]

data modify entity @s CustomName set from storage gm4_balloon_animals:temp trade.sell.components."minecraft:lore"[0].text
