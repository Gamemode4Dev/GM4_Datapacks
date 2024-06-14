# Replaces zombified piglin with piglin
# @s = zombified piglin with swiftness needing conversion
# at @s
# run from cure/zombified_check

summon piglin ~ ~ ~ {Tags:["gm4_mob_curing_new_piglin"]}

tp @e[type=piglin,distance=..1,tag=gm4_mob_curing_new_piglin,sort=nearest,limit=1] @s
data modify entity @e[type=piglin,tag=gm4_mob_curing_new_piglin,limit=1] {} merge from entity @s {}
tag @e[type=piglin,tag=gm4_mob_curing_new_piglin] remove gm4_mob_curing_new_piglin

particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_carrot"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
tp @s ~ ~-2050 ~
kill @s
