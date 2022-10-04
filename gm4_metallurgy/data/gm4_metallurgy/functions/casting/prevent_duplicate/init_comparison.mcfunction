# Initializes some values required for the comparisons.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from any function in casting/finish_band

# check length of excluded shamirs list (length changes as the shamir options remove themselves)
execute store result score $excluded_shamirs gm4_ml_data run data get storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs
scoreboard players set $cycle_count gm4_ml_data 1
tellraw @a ["",{"text":"Comparing...","color":"gray"}]
tellraw @a ["",{"text":"  Target: ","color":"blue"},{"nbt":"Item.tag.gm4_metallurgy.stored_shamir","entity":"@s","color":"gray"}]
tellraw @a ["",{"text":"  Exclude List: ","color":"blue"},{"nbt":"previous.excluded_shamirs","storage":"gm4_metallurgy:temp/item/cast","color":"gray"}]

# compare targeted memorized shamir if there are shamirs to exclude
execute if score $excluded_shamirs gm4_ml_data matches 1.. run function gm4_metallurgy:casting/prevent_duplicate/compare_entry
execute unless score $excluded_shamirs gm4_ml_data matches 1.. run tellraw @a ["",{"text":"  Allowed: ","color":"blue"},{"nbt":"Item.tag.gm4_metallurgy.stored_shamir","entity":"@s","color":"green"}]
