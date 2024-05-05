# process a link with 1 player
# @s = unspecified
# at unspecified
# run from armor/modifier/type/link/process/one_player_link

# grab item data from linked armor piece
execute if score @s gm4_ce_link_slot matches 0 run item replace block 29999998 1 7134 container.0 from entity @s armor.head
execute if score @s gm4_ce_link_slot matches 1 run item replace block 29999998 1 7134 container.0 from entity @s armor.chest
execute if score @s gm4_ce_link_slot matches 2 run item replace block 29999998 1 7134 container.0 from entity @s armor.legs
execute if score @s gm4_ce_link_slot matches 3 run item replace block 29999998 1 7134 container.0 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp components set from block 29999998 1 7134 Items[{Slot:0b}].components
data remove block 29999998 1 7134 Items

# set max health to calculated value
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount int 1 run scoreboard players get $set_max_health gm4_ce_data

# update linked armor piece
execute if score @s gm4_ce_link_slot matches 0 run function gm4_combat_expanded:item_modify_eval/head_update with storage gm4_combat_expanded:temp
execute if score @s gm4_ce_link_slot matches 1 run function gm4_combat_expanded:item_modify_eval/chest_update with storage gm4_combat_expanded:temp
execute if score @s gm4_ce_link_slot matches 2 run function gm4_combat_expanded:item_modify_eval/legs_update with storage gm4_combat_expanded:temp
execute if score @s gm4_ce_link_slot matches 3 run function gm4_combat_expanded:item_modify_eval/feet_update with storage gm4_combat_expanded:temp
function gm4_combat_expanded:armor/slot/silence_equip_sound
