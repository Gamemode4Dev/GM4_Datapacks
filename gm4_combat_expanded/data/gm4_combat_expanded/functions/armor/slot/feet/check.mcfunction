# process the boots
# @s = player wearing the armor
# at world spawn
# run from armor/process

# store information
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:3b}].tag

# check modifier
function gm4_combat_expanded:armor/modifier/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.feet gm4_combat_expanded:update
scoreboard players reset $change gm4_ce_data
