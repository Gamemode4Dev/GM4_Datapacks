# Cycles the list of memorized shamirs once, thereby decrementing the index of each element by 1. Element 0 becomes element -1.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from gm4_metallurgy:casting/prevent_duplicate/compare_entry

# cycle storage
data modify storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs append from storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs[0]
data remove storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs[0]
scoreboard players add $cycle_count gm4_ml_data 1

# try to prevent duplicate recast on new targeted memorized shamir
function gm4_metallurgy:casting/prevent_duplicate/compare_entry
