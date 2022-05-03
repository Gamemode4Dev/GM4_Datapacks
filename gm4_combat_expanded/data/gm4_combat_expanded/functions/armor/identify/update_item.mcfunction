# make final adjustments to storage for identification
# @s = player wearing the armor
# run from functions in armor/identify/check_mod/

# mark for change
scoreboard players set $change gm4_ce_data 1

# check if name was changed
# when player renames item it loses the translate tag and becomes shorter
data modify storage gm4_combat_expanded:temp stored_name set from storage gm4_combat_expanded:temp tag.display.Name
execute store result score $namelen gm4_ce_data run data get storage gm4_combat_expanded:temp stored_name

# apply modifier to storage
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag

# delete unid
data remove storage gm4_combat_expanded:temp tag.gm4_combat_expanded.unidentified
data remove storage gm4_combat_expanded:temp tag.gm4_combat_expanded.mod_id

# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# half durability damage taken
execute store result storage gm4_combat_expanded:temp tag.Damage int 0.5 run data get storage gm4_combat_expanded:temp tag.Damage

# keep old name if it was changed
execute if score $namelen gm4_ce_data matches ..75 run data modify entity @s Item.tag.display.Name set from storage gm4_combat_expanded:temp stored_name

# playsound
execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2

# advancement
advancement grant @s only gm4:combat_expanded_identify
