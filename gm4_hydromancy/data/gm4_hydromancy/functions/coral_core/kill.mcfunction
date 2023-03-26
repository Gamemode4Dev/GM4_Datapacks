# kill coral flower if it is destroyed, release heart of the sea
# @s = coral flower
# at @s positioned ~ ~-.4 ~
# run from coral_core/submain

data modify storage gm4_hydromancy:temp tag set from entity @s item.tag
summon item ~ ~ ~ {Tags:["gm4_hy_item_checked",],Motion:[0.0,0.15,0.0],PickupDelay:20,Item:{id:"minecraft:heart_of_the_sea",Count:1b,tag:{}}}
data modify entity @e[type=item,tag=gm4_hy_item_checked,limit=1,sort=nearest] Item.tag set from storage gm4_hydromancy:temp tag
data remove storage gm4_hydromancy:temp item
particle bubble_pop ~ ~0.15 ~ 0.2 0.35 0.2 0.05 24
playsound minecraft:block.beehive.exit block @a ~ ~ ~ 1 0.7
kill @s
execute positioned ~-7.5 ~-1.1 ~-7.5 run function gm4_hydromancy:coral_vine/check_connection
