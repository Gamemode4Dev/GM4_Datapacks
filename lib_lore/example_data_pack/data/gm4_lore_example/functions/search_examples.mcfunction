# demonstrates uses of search operation of lib_lore

## Searches for a duplicate line of lore from Player's mainhand
## Checks if any line of lore is the same as the first line

# set inputs
data modify storage gm4_lore:temp Source set from entity @s SelectedItem.tag.display.Lore
data modify storage gm4_lore:temp Target set from entity @s SelectedItem.tag.display.Lore[0]
scoreboard players set $start gm4_lore 1
# run operation
function #gm4_lore:search
# check if there was a duplicate line
execute unless score $index gm4_lore matches -1 run say There is a lore line that is exactly the same as the first lore line!
