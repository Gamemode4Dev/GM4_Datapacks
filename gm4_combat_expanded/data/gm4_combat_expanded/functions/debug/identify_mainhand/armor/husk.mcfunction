execute unless entity @e[type=item,distance=..7,nbt={Item:{tag:{gm4_combat_expanded:{identified:0}}}}] run loot spawn ~ ~ ~ loot gm4_combat_expanded:armor/material/iron/chest

data modify storage gm4_combat_expanded:temp tag set from entity @e[type=item,distance=..7,nbt={Item:{tag:{gm4_combat_expanded:{identified:0}}}},limit=1,sort=nearest] Item.tag
function gm4_combat_expanded:identification/armor/randomize_stats
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/common/husk
data modify storage gm4_combat_expanded:temp stored_name set from storage gm4_combat_expanded:temp tag.display.Name
execute store result score $namelen gm4_ce_data run data get storage gm4_combat_expanded:temp stored_name
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1
execute store result storage gm4_combat_expanded:temp tag.Damage int 0.5 run data get storage gm4_combat_expanded:temp tag.Damage
execute if score $namelen gm4_ce_data matches ..75 run data modify storage gm4_combat_expanded:temp tag.display.Name set from storage gm4_combat_expanded:temp stored_name
data modify entity @e[type=item,distance=..7,nbt={Item:{tag:{gm4_combat_expanded:{identified:0}}}},limit=1,sort=nearest] Item.tag set from storage gm4_combat_expanded:temp tag
