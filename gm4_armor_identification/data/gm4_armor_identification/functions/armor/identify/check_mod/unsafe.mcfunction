# run from armor/identify/check_unid
# @s = player wearing the armor

# randomize
function gm4_armor_identification:armor/identify/randomize_stats

# get unid
# unid is made out of two parts, this gets the second part which signifies the modifier on the armor
execute store result score $mod_id gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.mod_id

# check mod
execute if score $mod_id gm4_ai_data matches 1 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/rare/reactive
execute if score $mod_id gm4_ai_data matches 2 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/common/stall
execute if score $mod_id gm4_ai_data matches 3 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/common/retaliate
execute if score $mod_id gm4_ai_data matches 4 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/common/sentinel
execute if score $mod_id gm4_ai_data matches 5 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/epic/vorpal
execute if score $mod_id gm4_ai_data matches 6 run loot replace block 29999998 1 7134 container.4 loot gm4_armor_identification:armor/identification/epic/witch

# update item with mod
function gm4_armor_identification:armor/identify/update_item
