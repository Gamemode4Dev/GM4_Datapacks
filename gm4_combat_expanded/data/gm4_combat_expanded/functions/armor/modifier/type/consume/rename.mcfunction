# rename satiated armor unless it was renamed by the player
# @s = player wearing the armor
# at @s
# run from armor/consume/satiated

loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:technical/satiate_name
data modify storage gm4_combat_expanded:temp tag.display.Name set from block 29999998 1 7134 Items[{Slot:4b}].tag.display.Name
