#@s = pigmen with swiftness needing conversion
#run from main
summon villager ~ ~ ~ {Tags:["gm4_randomize_trades"],Profession:2,Offers:{Recipes:[{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:healing"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:slowness"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:poison"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:weakness"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:harming"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:fire_resistance"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:water_breathing"}}},{rewardExp:1b,buy:{id:"minecraft:emerald",Count:7b},sell:{id:"potion",Count:1b,tag:{Potion:"minecraft:swiftness"}}}]}}
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_apple"}},distance=..3,sort=nearest] run function mob_conversion:consume_item

#randomise the number of emeralds each potion costs
execute as @e[type=villager,tag=gm4_randomize_trades,limit=1,distance=..1] run function mob_conversion:randomize_trades

data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
