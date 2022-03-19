# run from armor/process_armor
# @s = player with a modified helmet

# store information
data modify storage gm4_combat_evolved:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag

# check modifier
function gm4_combat_evolved:armor/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run function gm4_combat_evolved:armor/slots/head/change
