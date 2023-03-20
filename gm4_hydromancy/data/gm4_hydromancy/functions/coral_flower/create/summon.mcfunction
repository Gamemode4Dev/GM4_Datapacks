# spawn a coral flower
# @s = heart of the sea item on a coral fan
# at @s
# run from coral_flower/create/check_item

data modify storage gm4_hydromancy:temp tag set from entity @s Item.tag
execute align xyz positioned ~.5 ~.5 ~.5 summon item_display run function gm4_hydromancy:coral_flower/create/store_data
data remove storage gm4_hydromancy:temp tag
kill @s
