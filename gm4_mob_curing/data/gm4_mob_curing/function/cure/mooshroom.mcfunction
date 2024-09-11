# Replaces cows with mooshrooms
# @s = cows with slowness needing conversion
# at @s
# run from check_item

summon mooshroom ~ ~ ~ {Tags:["gm4_mob_curing_new_mooshroom"]}

tp @e[type=mooshroom,distance=..1,tag=gm4_mob_curing_new_mooshroom,sort=nearest,limit=1] @s
data modify entity @e[type=mooshroom,tag=gm4_mob_curing_new_mooshroom,limit=1] {} merge from entity @s {}
tag @e[type=mooshroom,tag=gm4_mob_curing_new_mooshroom] remove gm4_mob_curing_new_mooshroom

particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:red_mushroom"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:brown_mushroom"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
tp @s ~ ~-2050 ~
kill @s
