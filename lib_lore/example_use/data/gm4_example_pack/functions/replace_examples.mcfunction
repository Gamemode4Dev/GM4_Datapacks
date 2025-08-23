# demonstrates uses of replace operation of lib_lore

## Replaces Lore in Player's mainhand

# set inputs
data modify storage gm4_lore:temp Source set from entity @s SelectedItem.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"This line will be replaced"}
data modify storage gm4_lore:temp Input set value [{"text":"This line will replace the line"}]
# run operation
function #gm4_lore:replace
# update player's item with item modifier
item modify entity @s weapon.mainhand gm4_example_pack:update_player



## Replaces Lore in an item

# set inputs
data modify storage gm4_lore:temp Source set from entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"This line will be replaced"}
data modify storage gm4_lore:temp Input set value [{"text":"This line will replace the line"},{"text":"This line will follow the line before it"}]
# run operation
function #gm4_lore:replace
# update item
data modify entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore" set from storage gm4_lore:temp Source



## Replaces Lore in one item, and transfers it to another item

# set inputs
summon item ~ ~ ~ {Tags:["item_1"],Item:{id:"minecraf:stick",components:{"minecraft:lore":[{"text":"TARGET_LINE"},{"text":"The first two lines will be skipped/ignored"},{"text":"The line after this one will be replaced"},{"text":"TARGET_LINE"},{"text":"This line will remain at the end"}]}}}
data modify storage gm4_lore:temp Source set from entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"TARGET_LINE"}
scoreboard players set $start gm4_lore 2
data modify storage gm4_lore:temp Input set value [{"text":"This line will replace the TARGET_LINE"},{"text":"This line will follow the line before it"}]
# run operation
function #gm4_lore:replace
# set updated lore into item_1
data modify entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore" set from storage gm4_lore:temp Source
# appends replaced lore line to the closest item
data modify entity @e[type=item,tag=!item_1,sort=nearest,limit=1] Item.components."minecraft:lore" append from storage gm4_lore:temp Dump
# note that using "Dump" and "Target" in the command above is functionally equivalent
