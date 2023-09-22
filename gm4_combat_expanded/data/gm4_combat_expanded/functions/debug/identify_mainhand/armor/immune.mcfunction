execute unless data entity @s SelectedItem.tag.gm4_combat_expanded{identified:0} run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:armor/material/iron/chest
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_combat_expanded:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag
function gm4_combat_expanded:armor/identify/randomize_stats

loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/rare/immune

data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1
item modify entity @s weapon.mainhand gm4_combat_expanded:update

execute at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 0.8 1.2
advancement grant @s only gm4:combat_evolved_identify
