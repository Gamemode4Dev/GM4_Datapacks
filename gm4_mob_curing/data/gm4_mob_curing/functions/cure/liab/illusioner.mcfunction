# Reverts the Illusioner to an Evoker
# @s = Illusioner with Swiftness needing conversion
# at @s
# run from cure/liab/check

summon evoker
particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:totem_of_undying"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
