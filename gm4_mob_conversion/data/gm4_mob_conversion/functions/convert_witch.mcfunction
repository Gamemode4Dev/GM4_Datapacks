# @s = witch with weakness needing conversion
# run from main
summon villager ~ ~ ~ {Tags:["gm4_mob_conversion_brewer","gm4_mob_conversion_needs_init"],VillagerData:{profession:"minecraft:cleric",level:5,type:"minecraft:plains"},Xp:1,CustomName:'{"translate":"%1$s%3427655$s","with":["Brewer§",{"translate": "entity.gm4.brewer"}]}', Offers:{Recipes:[{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:healing"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:slowness"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:poison"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:weakness"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:harming"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:fire_resistance"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:water_breathing"}},priceMultiplier:0.05f},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:swiftness"}},priceMultiplier:0.05f}]}}
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]

# Mark the gapple
tag @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_apple"}},distance=..3,sort=nearest] add gm4_gapple

# Randomise the number of emeralds each potion costs
execute as @e[type=villager,tag=gm4_mob_conversion_needs_init,limit=1,distance=..1] run function gm4_mob_conversion:initialise_brewer



execute as @e[type=item,limit=1,tag=gm4_gapple,distance=..3] run function gm4_mob_conversion:consume_item



data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
