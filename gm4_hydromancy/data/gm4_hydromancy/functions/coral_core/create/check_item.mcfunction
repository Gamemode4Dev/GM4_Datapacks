# check a dropped item for heart of the seas
# @s = item
# at undefined
# run from main

# TODO: fix clock, doesnt run after first time?
tag @s add gm4_hy_item_checked
execute if entity @s[tag=!gm4_hy_item_hots,nbt={Item:{id:"minecraft:heart_of_the_sea"}}] run tag @s add gm4_hy_item_hots
execute at @s[tag=gm4_hy_item_hots] if block ~ ~ ~ #gm4_hydromancy:coral_fans run function gm4_hydromancy:coral_core/create/summon
