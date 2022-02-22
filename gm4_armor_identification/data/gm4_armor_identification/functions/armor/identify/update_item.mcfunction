# run from armor/identify/start
# @s = unidentified armor item
# at @s

# mark for change
scoreboard players set $change gm4_ai_data 1

# check if name was changed
# when player renames item it loses the translate tag and becomes shorter
data modify storage gm4_armor_identification:temp stored_name set from storage gm4_armor_identification:temp tag.display.Name
execute store result score $namelen gm4_ai_data run data get storage gm4_armor_identification:temp stored_name

# apply modifier to storage
data modify storage gm4_armor_identification:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag

# delete unid
data remove storage gm4_armor_identification:temp tag.gm4_armor_identification.unidentified
data remove storage gm4_armor_identification:temp tag.gm4_armor_identification.mod_id

# half durability damage taken
execute store result storage gm4_armor_identification:temp tag.Damage int 0.5 run data get storage gm4_armor_identification:temp tag.Damage

# keep old name if it was changed
execute if score $namelen gm4_ai_data matches ..75 run data modify entity @s Item.tag.display.Name set from storage gm4_armor_identification:temp stored_name

# playsound
execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2
