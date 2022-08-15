# identify the chestplate
# @s = player wearing the armor
# at world spawn
# run from armor/process

# store information
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:1b}].tag

# check unid
function gm4_combat_expanded:armor/identify/check_unid

# make changes
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.chest gm4_combat_expanded:update
scoreboard players reset $change gm4_ce_data
