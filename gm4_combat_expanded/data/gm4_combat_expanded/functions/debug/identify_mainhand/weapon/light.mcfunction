execute unless data entity @s SelectedItem.tag.gm4_combat_expanded{identified:0} run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/iron
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_combat_expanded:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag
function gm4_combat_expanded:weapon/identify/randomize_stats
data modify storage gm4_combat_expanded:temp stored_name set from storage gm4_combat_expanded:temp tag.display.Name
execute store result score $namelen gm4_ce_data run data get storage gm4_combat_expanded:temp stored_name
loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/common/light
data modify storage gm4_combat_expanded:temp tag set from block 29999998 1 7134 Items[{Slot:1b}].tag
execute store result storage gm4_combat_expanded:temp tag.Damage int 0.5 run data get storage gm4_combat_expanded:temp tag.Damage
execute if score $namelen gm4_ce_data matches ..75 run data modify storage gm4_combat_expanded:temp tag.display.Name set from storage gm4_combat_expanded:temp stored_name
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded append value {identified:1}
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.sharpness set from block 29999998 1 7134 Items[{Slot:0b}].tag.Enchantments[{id:"minecraft:sharpness"}].lvl
item modify entity @s weapon.mainhand gm4_combat_expanded:update
execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2
advancement grant @s only gm4:combat_evolved_identify
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute store result score $stored_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.sharpness
execute unless score $stored_sharpness gm4_ce_data = $current_sharpness gm4_ce_data run function gm4_combat_expanded:weapon/update_sharpness
