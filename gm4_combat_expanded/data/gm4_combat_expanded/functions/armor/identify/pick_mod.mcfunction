# gives newly equipped a random unid (stored modifier), this does not identify that armor
# @s = player wearing the armor
# at world spawn
# run from armor/identify/check_unid

# mark for change
scoreboard players set $change gm4_ce_data 1

# get a random modifier and apply it to the storage
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/unidentified/random
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded merge from block 29999998 1 7134 Items[{Slot:4b}].tag.gm4_combat_expanded

# get the new unid
execute store result score $unidentified gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.unidentified
