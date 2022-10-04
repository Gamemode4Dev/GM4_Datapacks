# Initializes some values required for the comparisons.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from any function in casting/finish_band

# check length of excluded shamirs list (length changes as the shamir options remove themselves)
execute store result score $excluded_shamirs gm4_ml_data run data get storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs
scoreboard players set $cycle_count gm4_ml_data 1

# compare targeted memorized shamir if there are shamirs to exclude
execute if score $excluded_shamirs gm4_ml_data matches 1.. run function gm4_metallurgy:casting/prevent_duplicate/compare_entry
