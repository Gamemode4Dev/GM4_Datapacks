# run from armor/process_armor
# @s = player with modified boots

# store information
data modify storage gm4_combat_evolved:temp tag set from block 29999998 1 7134 Items[{Slot:3b}].tag

# check unid
function gm4_combat_evolved:armor/identify/check_unid

# make changes
execute if score $change gm4_ce_data matches 1 run function gm4_combat_evolved:armor/slots/feet/change