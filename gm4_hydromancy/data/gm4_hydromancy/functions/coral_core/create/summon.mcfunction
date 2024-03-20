# spawn a coral flower
# @s = heart of the sea item on a coral fan
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from coral_core/create/check_item

data modify storage gm4_hydromancy:temp tag set from entity @s Item.tag
execute summon item_display run function gm4_hydromancy:coral_core/create/store_data
data remove storage gm4_hydromancy:temp tag
playsound minecraft:block.beehive.enter block @a ~ ~ ~ 1 0.7
playsound minecraft:block.conduit.activate block @a ~ ~ ~ 1 1.75
kill @s
