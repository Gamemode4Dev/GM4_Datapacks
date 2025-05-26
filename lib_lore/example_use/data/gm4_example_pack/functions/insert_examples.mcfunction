# demonstrates uses of insert operation of lib_lore

## Inserts Lore in Player's mainhand

# set inputs
data modify storage gm4_lore:temp Source set from entity @s SelectedItem.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"The inserted lines will appear after this line"}
data modify storage gm4_lore:temp Input set value [{"text":"This line will be inserted after the line"},{"text":"This line will also be inserted after the line"},{"text":"Same with this line"}]
# run operation
function #gm4_lore:insert
# update player's item with item modifier
item modify entity @s weapon.mainhand gm4_example_pack:update_player



## Inserts Lore in an item

# set inputs
data modify storage gm4_lore:temp Source set from entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"The inserted lines will appear before this line since start is -1"}
data modify storage gm4_lore:temp Input set value [{"text":"This line will be inserted before the line"},{"text":"This line will also be inserted, following the previous line (still in front of the TARGET_LINE)"}]
scoreboard players set $start gm4_lore -1
# run operation
function #gm4_lore:insert
# update item
data modify entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore" set from storage gm4_lore:temp Source



## Inserts Lore in one item, and also transfers them to another item

# set inputs
summon item ~ ~ ~ {Tags:["item_1"],Item:{components:{"minecraft:lore":[{"text":"TARGET_LINE"},{"text":"The inserted lines will appear after this line"},{"text":"The inserted lines will appear before this line"}]}}}
data modify storage gm4_lore:temp Source set from entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value {"text":"TARGET_LINE"}
scoreboard players set $start gm4_lore 1
data modify storage gm4_lore:temp Input set value [{"text":"This line will be inserted"},{"text":"This line will follow the line before it"}]
# run operation
function #gm4_lore:insert
# set updated lore into item_1
data modify entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore" set from storage gm4_lore:temp Source
# appends inserted lore line to the closest item
data modify entity @e[type=item,tag=!item_1,sort=nearest,limit=1] Item.components."minecraft:lore" append from storage gm4_lore:temp Dump
# note that using "Dump" and "Input" in the command above is functionally equivalent
