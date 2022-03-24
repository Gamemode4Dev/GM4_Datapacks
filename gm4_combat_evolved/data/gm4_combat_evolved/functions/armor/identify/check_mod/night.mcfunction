# run from armor/identify/check_unid
# @s = player wearing the armor

# randomize
function gm4_combat_evolved:armor/identify/randomize_stats

# get unid
# unid is made out of two parts, this gets the second part which signifies the modifier on the armor
execute store result score $mod_id gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.mod_id

# check mod
execute if score $mod_id gm4_ce_data matches 1 run loot replace block 29999998 1 7134 container.4 loot gm4_combat_evolved:armor/identification/common/lunar
execute if score $mod_id gm4_ce_data matches 2 run loot replace block 29999998 1 7134 container.4 loot gm4_combat_evolved:armor/identification/common/gloom
execute if score $mod_id gm4_ce_data matches 3 run loot replace block 29999998 1 7134 container.4 loot gm4_combat_evolved:armor/identification/common/nocturnal
execute if score $mod_id gm4_ce_data matches 4 run loot replace block 29999998 1 7134 container.4 loot gm4_combat_evolved:armor/identification/rare/shadow

# update item with mod
function gm4_combat_evolved:armor/identify/update_item
