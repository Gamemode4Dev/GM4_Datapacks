# process a link with 1 player
# @s = unspecified
# at unspecified
# run from armor/modifier/type/link/process/one_player_link

# grab item data from linked armor piece
execute if score @s gm4_ce_link_slot matches 0 run item replace block 29999998 1 7134 container.0 from entity @s armor.head
execute if score @s gm4_ce_link_slot matches 1 run item replace block 29999998 1 7134 container.0 from entity @s armor.chest
execute if score @s gm4_ce_link_slot matches 2 run item replace block 29999998 1 7134 container.0 from entity @s armor.legs
execute if score @s gm4_ce_link_slot matches 3 run item replace block 29999998 1 7134 container.0 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag
data remove block 29999998 1 7134 Items

# set max health to calculated value
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_combat_expanded"}].Amount int 1 run scoreboard players get $set_max_health gm4_ce_data

# update linked armor piece
execute if score @s gm4_ce_link_slot matches 0 run item modify entity @s armor.head gm4_combat_expanded:update
execute if score @s gm4_ce_link_slot matches 1 run item modify entity @s armor.chest gm4_combat_expanded:update
execute if score @s gm4_ce_link_slot matches 2 run item modify entity @s armor.legs gm4_combat_expanded:update
execute if score @s gm4_ce_link_slot matches 3 run item modify entity @s armor.feet gm4_combat_expanded:update
function gm4_combat_expanded:armor/slot/silence_equip_sound
