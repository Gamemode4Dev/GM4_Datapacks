# Replaces zombified hoglin with hoglin
# @s = zombified hoglin with swiftness needing conversion
# at @s
# run from main

summon hoglin ~ ~ ~ {Tags:["gm4_mob_curing_new_hoglin"]}

tp @e[type=hoglin,distance=..1,tag=gm4_mob_curing_new_hoglin,sort=nearest,limit=1] @s
data modify entity @e[type=hoglin,tag=gm4_mob_curing_new_hoglin,limit=1] {} merge from entity @s {}
tag @e[type=hoglin,tag=gm4_mob_curing_new_hoglin] remove gm4_mob_curing_new_hoglin

particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:golden_carrot"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
tp @s ~ ~-2050 ~
kill @s
