# Reverts the Illusioner to an Evoker
# @s = Illusioner with Swiftness needing conversion
# at @s
# run from cure/liab/check

summon evoker ~ ~ ~ {Tags:["gm4_mob_curing_new_evoker"]}

tp @e[type=evoker,distance=..1,tag=gm4_mob_curing_new_evoker,sort=nearest,limit=1] @s
data modify entity @e[type=evoker,tag=gm4_mob_curing_new_evoker,limit=1] {} merge from entity @s {}
tag @e[type=evoker,tag=gm4_mob_curing_new_evoker] remove gm4_mob_curing_new_evoker

particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:totem_of_undying"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
tp @s ~ ~-2050 ~
kill @s
