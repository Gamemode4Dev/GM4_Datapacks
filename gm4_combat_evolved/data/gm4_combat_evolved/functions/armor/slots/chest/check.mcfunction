# process the chestplate
# @s = player wearing the armor
# run from armor/process

# store information
data modify storage gm4_combat_evolved:temp tag set from storage gm4_combat_evolved:temp Items[{Slot:1b}].tag

# check modifier
function gm4_combat_evolved:armor/modifiers/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.chest gm4_combat_evolved:update
scoreboard players reset $change gm4_ce_data
