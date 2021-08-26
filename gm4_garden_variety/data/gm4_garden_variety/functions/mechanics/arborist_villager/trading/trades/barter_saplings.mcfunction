# run from TODO


### initialize ###

# reset storage
data remove storage gm4_garden_variety:data/arborist next_trade

# summon armor stand marker
summon armor_stand ~ ~ ~ {Small:1b,Invulnerable:1b,Invisible:0b,Silent:1b,Tags:["gm4_arborist_trade"],NoGravity:1b}


### sell ###

# set trade item
data modify entity @s HandItems[1] set from storage gm4_garden_variety:data/arborist/last_sell Recipes.sell
execute as @s run loot replace entity @s weapon.mainhand loot gm4_garden_variety:arborist/trades/barter_saplings/sell
data modify storage gm4_garden_variety:data/arborist next_trade.sell set from entity @s HandItems[0]

# clear hand slot
data modify entity @s HandItems[1] set value {}

### buy ###

# set trade item
data modify entity @s ArmorItems[0] set from storage gm4_garden_variety:data/arborist next_trade.sell
execute as @s run loot replace entity @s weapon.mainhand loot gm4_garden_variety:arborist/trades/barter_saplings/buy
data modify storage gm4_garden_variety:data/arborist next_trade.buy set from entity @s HandItems[0]


### buyb ###

# set trade item
data modify entity @s ArmorItems[1] set from storage gm4_garden_variety:data/arborist next_trade.buy
execute as @s run loot replace entity @s weapon.mainhand loot gm4_garden_variety:arborist/trades/barter_saplings/buyb
data modify storage gm4_garden_variety:data/arborist next_trade.buyB set from entity @s HandItems[0]
data modify storage gm4_garden_variety:test test set from storage gm4_garden_variety:data/arborist next_trade.buyb


### finalize ###

# kill armor stand marker
kill @e[tag=gm4_arborist_trade]

# set other trade data
data modify storage gm4_garden_variety:data/arborist next_trade.xp set value 1
data modify storage gm4_garden_variety:data/arborist next_trade.maxUses set value 8
data modify storage gm4_garden_variety:data/arborist next_trade.priceMultiplier set value 0.1f

# store trades into nbt
data modify entity @s Offers.Recipes append from storage gm4_garden_variety:data/arborist next_trade

# update debug storage
data modify storage gm4_garden_variety:debug/arborist trades.level_1.barter_saplings append from storage gm4_garden_variety:data/arborist next_trade.sell.id

# loop
scoreboard players remove $trade_amount gm4_gv_trades 1
execute if score $trade_amount gm4_gv_trades matches 1.. run function gm4_garden_variety:mechanics/arborist_villager/trading/trades/barter_saplings