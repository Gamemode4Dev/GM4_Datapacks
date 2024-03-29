execute unless data entity @s SelectedItem.tag.gm4_combat_expanded{identified:0}.armor_clamp run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:armor/material/iron/chest
data modify storage gm4_combat_expanded:temp tag set from entity @s SelectedItem.tag

function gm4_combat_expanded:identification/armor/randomize_stats
$loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp tag.Damage set value 0

item modify entity @s weapon.mainhand gm4_combat_expanded:identify_mainhand
data remove block 29999998 1 7134 Items
