# drops items from the auto crafter buffer
# @s = auto_crafter marker
# located at @s
# run from gm4_auto_crafting:machine/destroy

loot spawn ~ ~ ~ loot gm4_auto_crafting:technical/temp_drop
tag @e[type=item,distance=..0.5,nbt={Age:0s,Item:{tag:{gm4_auto_crafting_temp:1b},Count:1b}},limit=1] add gm4_ac_item
data modify entity @e[type=item,tag=gm4_ac_item,distance=..0.5,limit=1] Item set from storage gm4_auto_crafting:temp buffer[-1]
tag @e[type=item,distance=..0.5] remove gm4_ac_item
data remove storage gm4_auto_crafting:temp buffer[-1]
execute if data storage gm4_auto_crafting:temp buffer[-1] run function gm4_auto_crafting:machine/drop_items
