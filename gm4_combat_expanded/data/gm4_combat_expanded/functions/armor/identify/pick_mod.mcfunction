# gives newly equipped a random unid (stored modifier), this does not identify that armor
# @s = player wearing the armor
# at world spawn
# run from any armor/slot/SLOT/identify

# randomize stats
function gm4_combat_expanded:armor/identify/randomize_stats

# get a random modifier and apply it to the storage
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/random

# check if name was changed
# when player renames item it loses the translate tag and becomes shorter
data modify storage gm4_combat_expanded:temp stored_name set from storage gm4_combat_expanded:temp tag.display.Name
execute store result score $namelen gm4_ce_data run data get storage gm4_combat_expanded:temp stored_name

# apply modifier to storage
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag

# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# half durability damage taken
execute store result storage gm4_combat_expanded:temp tag.Damage int 0.5 run data get storage gm4_combat_expanded:temp tag.Damage

# keep old name if it was changed
execute if score $namelen gm4_ce_data matches ..75 run data modify storage gm4_combat_expanded:temp tag.display.Name set from storage gm4_combat_expanded:temp stored_name

# playsound
execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2

# advancement
advancement grant @s only gm4:combat_expanded_identify
