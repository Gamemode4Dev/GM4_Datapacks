# run from armor/identify/check_unid
# @s = player wearing the armor

# mark for change
scoreboard players set $change gm4_ce_data 1

# get a random modifier and apply it to the item
loot replace block 29999998 1 7134 container.4 loot gm4_combat_evolved:armor/unidentified/random
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved merge from block 29999998 1 7134 Items[{Slot:4b}].tag.gm4_combat_evolved

# get new unid
execute store result score $unidentified gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.unidentified
