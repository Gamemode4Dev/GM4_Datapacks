# Compares the currently targeted memorized shamir to this shamir option.
# @s = new obsidian cast that was created by a recasted band
# at location of mold requesting a band
# run from gm4_metallurgy:casting/prevent_duplicate/init_comparison and recursed from gm4_metallurgy:casting/prevent_duplicate/cycle_list
tellraw @a ["",{"text":"    Step: ","color":"blue"},{"score":{"name":"$cycle_count","objective":"gm4_ml_data"},"color":"gray"},{"text":", Entry: ","color":"blue"},{"nbt":"previous.excluded_shamirs[0]","storage":"gm4_metallurgy:temp/item/cast","color":"gray"}]
# check whether currently target memorized shamir is this shamir option
data modify storage gm4_metallurgy:temp/item/cast previous.target_shamir set from storage gm4_metallurgy:temp/item/cast previous.excluded_shamirs[0]
execute store result score $different_shamir gm4_ml_data run data modify storage gm4_metallurgy:temp/item/cast previous.target_shamir set from entity @s Item.tag.gm4_metallurgy.stored_shamir

# decide whether to target the next memorized shamir or remove the duplicate if a match was found
execute unless score $different_shamir gm4_ml_data matches 1 run function gm4_metallurgy:casting/prevent_duplicate/remove_entry
execute if score $different_shamir gm4_ml_data matches 1 if score $cycle_count gm4_ml_data < $excluded_shamirs gm4_ml_data run function gm4_metallurgy:casting/prevent_duplicate/cycle_list
execute if score $different_shamir gm4_ml_data matches 1 if score $cycle_count gm4_ml_data = $excluded_shamirs gm4_ml_data run tellraw @a ["",{"text":"      Allowed: ","color":"blue"},{"nbt":"Item.tag.gm4_metallurgy.stored_shamir","entity":"@s","color":"green"}]
