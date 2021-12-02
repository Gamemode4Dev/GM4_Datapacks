# @s = zombified piglin with swiftness needing conversion
# run from cure/zombified_check

summon pig
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_carrot"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
