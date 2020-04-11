#@s = cows with slowness needing conversion at @s
#run from main
summon mooshroom
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:red_mushroom"}},distance=..3,sort=nearest] run function gm4_mob_conversion:consume_item
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:brown_mushroom"}},distance=..3,sort=nearest] run function gm4_mob_conversion:consume_item
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
