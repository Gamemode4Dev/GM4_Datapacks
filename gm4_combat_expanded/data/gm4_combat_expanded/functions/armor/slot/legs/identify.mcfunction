# identify the leggings
# @s = player wearing the armor
# run from armor/process

# store information
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:2b}].tag

# check unid
function gm4_combat_expanded:armor/identify/check_unid

# make changes
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.legs gm4_combat_expanded:update
scoreboard players reset $change gm4_ce_data
