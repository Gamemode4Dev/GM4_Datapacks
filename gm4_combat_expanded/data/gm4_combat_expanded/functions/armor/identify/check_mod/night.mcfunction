# applies the modifier stored in the armor unid to storage, then calls to update that armor on the player
# @s = player wearing the armor
# at world spawn
# run from armor/identify/check_unid

# randomize
function gm4_combat_expanded:armor/identify/randomize_stats

# get unid
# unid is made out of two parts, this gets the second part which signifies the modifier on the armor
execute store result score $mod_id gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.mod_id

# check mod
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/check_id/night

# update item with mod
function gm4_combat_expanded:armor/identify/update_item
