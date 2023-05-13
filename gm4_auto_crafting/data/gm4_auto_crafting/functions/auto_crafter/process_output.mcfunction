# processes the items for crafting
# @s = auto crafter that has been pulsed
# located at @s
# run from gm4_auto_crafting:tick

# get recipe input
data modify storage gm4_auto_crafting:temp items set from entity @s data.gm4_auto_crafting.buffer
data modify storage gm4_auto_crafting:temp output.buffer set from storage gm4_auto_crafting:temp items
scoreboard players operation $current gm4_ac_shape = @s gm4_ac_shape

data remove storage gm4_custom_crafters:temp/crafter Items
execute if score $current gm4_ac_shape matches 256.. run function gm4_auto_crafting:auto_crafter/shape/slot_0
execute if score $current gm4_ac_shape matches 128.. run function gm4_auto_crafting:auto_crafter/shape/slot_1
execute if score $current gm4_ac_shape matches 64.. run function gm4_auto_crafting:auto_crafter/shape/slot_2
execute if score $current gm4_ac_shape matches 32.. run function gm4_auto_crafting:auto_crafter/shape/slot_3
execute if score $current gm4_ac_shape matches 16.. run function gm4_auto_crafting:auto_crafter/shape/slot_4
execute if score $current gm4_ac_shape matches 8.. run function gm4_auto_crafting:auto_crafter/shape/slot_5
execute if score $current gm4_ac_shape matches 4.. run function gm4_auto_crafting:auto_crafter/shape/slot_6
execute if score $current gm4_ac_shape matches 2.. run function gm4_auto_crafting:auto_crafter/shape/slot_7
execute if score $current gm4_ac_shape matches 1.. run function gm4_auto_crafting:auto_crafter/shape/slot_8

# if there are still items in the buffer, move them to the output
data modify storage gm4_auto_crafting:temp output.temp set from storage gm4_auto_crafting:temp items

# set slot count and stack size
scoreboard players operation $slot_count gm4_crafting = @s gm4_ac_slot_count
scoreboard players set $stack_size gm4_crafting 1

# mimic custom craft
function gm4_auto_crafting:auto_crafter/craft/attempt_craft

# update output
execute if score $crafted gm4_crafting matches 0 run data modify storage gm4_auto_crafting:temp output.temp set from storage gm4_auto_crafting:temp output.buffer
data modify block 29999998 1 7134 Items append from storage gm4_auto_crafting:temp output.temp[]

# count items in output before completing the craft
data modify storage gm4_auto_crafting:temp output.check set from block ^ ^-1 ^-1 Items
data modify storage gm4_auto_crafting:temp output.original set from storage gm4_auto_crafting:temp output.check
scoreboard players reset $overflow_check gm4_ac_buffer
function gm4_auto_crafting:auto_crafter/check_overflow/count_items
scoreboard players operation $original_count gm4_ac_buffer = $overflow_check gm4_ac_buffer

# count items in shulker box
data modify storage gm4_auto_crafting:temp output.check set from block 29999998 1 7134 Items
scoreboard players reset $overflow_check gm4_ac_buffer
function gm4_auto_crafting:auto_crafter/check_overflow/count_items
scoreboard players operation $added_count gm4_ac_buffer = $overflow_check gm4_ac_buffer

# move item from shulker box to output barrel
execute store result score $inserted gm4_ac_buffer run loot insert ^ ^-1 ^-1 mine 29999998 1 7134 air{drop_contents:1b}

# count items in output after completing the craft
data modify storage gm4_auto_crafting:temp output.check set from block ^ ^-1 ^-1 Items
scoreboard players reset $overflow_check gm4_ac_buffer
function gm4_auto_crafting:auto_crafter/check_overflow/count_items
scoreboard players operation $updated_count gm4_ac_buffer = $overflow_check gm4_ac_buffer

# check if the insert was successful
scoreboard players operation $updated_count gm4_ac_buffer -= $added_count gm4_ac_buffer
scoreboard players operation $updated_count gm4_ac_buffer -= $original_count gm4_ac_buffer
execute unless score $updated_count gm4_ac_buffer matches 0 positioned ^ ^ ^-1 run function gm4_auto_crafting:auto_crafter/check_overflow/failed
execute if score $updated_count gm4_ac_buffer matches 0 positioned ^ ^ ^-1 run function gm4_auto_crafting:auto_crafter/check_overflow/success

# clean up
data remove storage gm4_auto_crafting:temp items
data remove storage gm4_auto_crafting:temp output
data remove block 29999998 1 7134 Items
