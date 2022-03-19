# run from weapon/process_weapon
# @s = player wielding the weapon

# randomize stats
function gm4_combat_evolved:weapon/identify/randomize_stats

# check if name was changed
# when player renames item it loses the translate tag and becomes shorter
data modify storage gm4_combat_evolved:temp stored_name set from storage gm4_combat_evolved:temp tag.display.Name
execute store result score $namelen gm4_ce_data run data get storage gm4_combat_evolved:temp stored_name

# get a random modifier and put in storage
loot replace block 29999998 1 7134 container.1 loot gm4_combat_evolved:weapons/modifiers/random
data modify storage gm4_combat_evolved:temp tag set from block 29999998 1 7134 Items[{Slot:1b}].tag

# half durability damage taken
execute store result storage gm4_combat_evolved:temp tag.Damage int 0.5 run data get storage gm4_combat_evolved:temp tag.Damage

# keep old name if it was changed
execute if score $namelen gm4_ce_data matches ..75 run data modify storage gm4_combat_evolved:temp tag.display.Name set from storage gm4_combat_evolved:temp stored_name

# modify item
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.sharpness set from block 29999998 1 7134 Items[{Slot:0b}].tag.Enchantments[{id:"minecraft:sharpness"}].lvl
item modify entity @s weapon.mainhand gm4_combat_evolved:update

# playsound
execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2
