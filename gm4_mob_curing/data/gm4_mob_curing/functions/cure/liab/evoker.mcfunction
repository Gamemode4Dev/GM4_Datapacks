# Reverts the Evoker to an Pillager
# @s = Evoker with Slowness II needing conversion
# at @s
# run from cure/liab/check

summon pillager ~ ~ ~ {Tags:["gm4_mob_curing_new_pillager"]}

tp @e[type=pillager,distance=..1,tag=gm4_mob_curing_new_pillager,sort=nearest,limit=1] @s
data modify entity @e[type=pillager,tag=gm4_mob_curing_new_pillager,limit=1] {} merge from entity @s {}
tag @e[type=pillager,tag=gm4_mob_curing_new_pillager] remove gm4_mob_curing_new_pillager

particle explosion ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.zombie_villager.converted neutral @a[distance=..8]
execute as @e[type=item,limit=1,nbt={Item:{id:"minecraft:crossbow"}},distance=..3,sort=nearest] run function gm4_mob_curing:cure/consume_item
tp @s ~ ~-2050 ~
kill @s
