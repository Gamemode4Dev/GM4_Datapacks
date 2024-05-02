# demonstrates uses of remove operation of lib_lore

## Removes 1 line of lore from Player's mainhand

# set inputs
data modify storage gm4_lore:temp Source set from entity @s SelectedItem.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"text":"This line will be removed"}'
# run operation
function #gm4_lore:remove
# update player's item with item modifier
item modify entity @s weapon.mainhand gm4_example_pack:update_player



## Removes 3 lines of lore from an item

# set inputs
data modify storage gm4_lore:temp Source set from entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"text":"The 3 lines before this line will be removed"}'
scoreboard players set $start gm4_lore -3
scoreboard players set $extra gm4_lore 2
# run operation
function #gm4_lore:remove
# update item
data modify entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:lore" set from storage gm4_lore:temp Source



## Removes lore from one item, and transfers it to another item

# set inputs
summon item ~ ~ ~ {Tags:["item_1"],Item:{components:{"minecraft:lore":['{"text":"This line and the ones after will be searched for the TARGET_LINE"}','{"text":"FILLER_LINE"}','{"text":"TARGET_LINE"}','{"text":"The line after this line will be removed, since start is 2 (2 after TARGET_LINE)"}','{"text":"This line will be removed and appended to another item"}','{"text":"This line will be removed and appended to another item since extra is -1"}','{"text":"This line will be removed and appended to another item since extra is -1"}']}}}
data modify storage gm4_lore:temp Source set from entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"text":"TARGET_LINE"}'
scoreboard players set $start gm4_lore 2
scoreboard players set $extra gm4_lore -1
# run operation
function #gm4_lore:remove
# set updated lore into item_1
data modify entity @e[type=item,tag=item_1,limit=1] Item.components."minecraft:lore" set from storage gm4_lore:temp Source
# appends removed lore lines to the closest item
data modify entity @e[type=item,tag=!item_1,sort=nearest,limit=1] Item.components."minecraft:lore" append from storage gm4_lore:temp Dump
