# processes the items based on the recipe shape
# @s = auto crafter that has been pulsed
# located at @s
# run from gm4_auto_crafting:tick

# get recipe input
data modify storage gm4_auto_crafting:temp items set from entity @s data.gm4_auto_crafting.buffer
data modify storage gm4_auto_crafting:temp output.original set from storage gm4_auto_crafting:temp items
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
scoreboard players set $stack_count gm4_crafting 1

# mimic custom craft
function gm4_auto_crafting:auto_crafter/craft/attempt_craft

# update output
execute if score $crafted gm4_crafting matches 0 run data modify storage gm4_auto_crafting:temp output.temp set from storage gm4_auto_crafting:temp output.original
#execute store result score $expected_difference gm4_ac_buffer run data get storage gm4_auto_crafting:temp output.temp
data modify block 29999998 1 7134 Items append from storage gm4_auto_crafting:temp output.temp[]

# move item from shulker box to output barrel
#data modify storage gm4_auto_crafting:temp output.temp set from block 29999998 1 7134 Items
#execute store result score $expected gm4_ac_buffer run data get storage gm4_auto_crafting:temp output.temp
#data modify block 29999998 1 7134 Items set from storage gm4_auto_crafting:temp output.temp
execute store result score $inserted gm4_ac_buffer run loot insert ^ ^-1 ^-1 mine 29999998 1 7134 air{drop_contents:1b}

# mark as completed craft
tag @s remove gm4_ac_full
scoreboard players reset @s gm4_ac_buffer

# clean up
data remove storage gm4_auto_crafting:temp items
data remove storage gm4_auto_crafting:temp output
data remove entity @s data.gm4_auto_crafting.buffer
data remove block 29999998 1 7134 Items
