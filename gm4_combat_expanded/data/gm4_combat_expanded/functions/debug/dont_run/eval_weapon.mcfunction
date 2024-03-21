execute unless data entity @s SelectedItem.tag.gm4_combat_expanded{identified:0}.damage run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/iron
data modify storage gm4_combat_expanded:temp tag set from entity @s SelectedItem.tag

function gm4_combat_expanded:identification/weapon/randomize_stats
$loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:1b}].tag
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp tag.Damage set value 0

item modify entity @s weapon.mainhand gm4_combat_expanded:identify_mainhand
data remove block 29999998 1 7134 Items
