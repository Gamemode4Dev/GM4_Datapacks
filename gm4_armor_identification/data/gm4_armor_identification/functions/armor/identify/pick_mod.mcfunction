# run from armor/identify/check_unid
# @s = player wearing the armor

# mark for change
scoreboard players set $change gm4_ai_data 1

# get a random modifier and apply it to the item
loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/unidentified/random
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification merge from block 29999998 1 7134 Items[{Slot:4b}].tag.gm4_armor_identification

# get new unid
execute store result score $unidentified gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.unidentified
