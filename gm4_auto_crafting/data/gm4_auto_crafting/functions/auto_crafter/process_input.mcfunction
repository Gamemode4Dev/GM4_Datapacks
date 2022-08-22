# takes items out of the input barrel
# @s = auto crafter that has the proper multi-block
# located at @s
# run from gm4_auto_crafting:main

# get next item from input barrel
data modify storage gm4_auto_crafting:temp buffer_item set from block ^ ^1 ^-1 Items[0]
data modify storage gm4_auto_crafting:temp Item set from storage gm4_auto_crafting:temp buffer_item

# fill up next available slot
data modify storage gm4_auto_crafting:temp buffer_item.Count set value 1b
execute store result storage gm4_auto_crafting:temp buffer_item.Slot byte 1 run scoreboard players add @s gm4_ac_buffer 9
data modify entity @s data.gm4_auto_crafting.buffer append from storage gm4_auto_crafting:temp buffer_item

# check if the buffer is full
## add 9, remove 8 = add 1
scoreboard players remove @s gm4_ac_buffer 8
execute if score @s gm4_ac_buffer >= @s gm4_ac_slot_count run tag @s add gm4_ac_full

# remove item from the input barrel
execute store result score $count gm4_ac_buffer run data get storage gm4_auto_crafting:temp Item.Count 0.99
execute if score $count gm4_ac_buffer matches 0 run data remove block ^ ^1 ^-1 Items[0]
execute if score $count gm4_ac_buffer matches 1.. store result block ^ ^1 ^-1 Items[0].Count byte 1 run scoreboard players get $count gm4_ac_buffer

# clean up
data remove storage gm4_auto_crafting:temp buffer_item
data remove storage gm4_auto_crafting:temp Item
