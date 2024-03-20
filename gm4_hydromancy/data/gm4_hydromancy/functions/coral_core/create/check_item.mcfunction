# check a dropped item for heart of the seas
# @s = item
# at undefined
# run from main

execute if entity @s[tag=!gm4_hy_item_hots,nbt={Item:{id:"minecraft:heart_of_the_sea"}}] run tag @s add gm4_hy_item_hots
tag @s[tag=!gm4_hy_item_hots] add gm4_hy_item_checked
execute at @s[tag=gm4_hy_item_hots] if block ~ ~ ~ #gm4_hydromancy:coral_fans[waterlogged=true] align xyz unless entity @e[type=item_display,tag=gm4_hy_coral_core,dx=0,dy=0,dz=0] positioned ~.5 ~.5 ~.5 run function gm4_hydromancy:coral_core/create/summon
