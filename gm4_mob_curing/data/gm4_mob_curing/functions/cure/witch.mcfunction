# Replaces the Witch with a Potion Cleric
# @s = witch with weakness needing conversion
# at @s
# run from main

summon villager ~ ~ ~ {Tags:["gm4_mob_curing_potion_cleric","gm4_mob_curing_needs_init"],VillagerData:{profession:"minecraft:cleric",level:5,type:"minecraft:plains"},Xp:1,CustomName:'{"translate":"%1$s%3427655$s","with":["Potion Cleric§",{"translate":"entity.gm4.potion_cleric"}]}'}

# Mark the gapple
tag @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_apple"}},distance=..3,sort=nearest] add gm4_gapple

# Randomise the number of emeralds each potion costs
execute as @e[type=villager,tag=gm4_mob_curing_needs_init,limit=1,distance=..1] at @s run function gm4_mob_curing:potion_cleric/initialise

# effects
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]

# Clean up
execute as @e[type=item,limit=1,tag=gm4_gapple,distance=..3] run function gm4_mob_curing:cure/consume_item

data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
