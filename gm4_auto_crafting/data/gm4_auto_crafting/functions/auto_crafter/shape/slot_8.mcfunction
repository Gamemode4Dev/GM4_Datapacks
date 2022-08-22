# processes the items based on the recipe shape
# @s = auto crafter that has a slot_0 item
# located at @s
# run from gm4_auto_crafting:auto_crafter/process_output

data modify storage gm4_auto_crafting:temp items[0].Slot set value 8b
data modify storage gm4_custom_crafters:temp/crafter Items append from storage gm4_auto_crafting:temp items[0]
data remove storage gm4_auto_crafting:temp items[0]
scoreboard players remove $current gm4_ac_shape 1
