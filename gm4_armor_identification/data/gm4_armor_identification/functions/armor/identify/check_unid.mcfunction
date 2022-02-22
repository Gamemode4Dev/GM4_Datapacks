# run from armor/slots/SLOT/identify
# @s = player wearing the armor

# get unid
# unid is made out of two parts, this gets the first part which signifies the way the armor is identified
execute store result score $unidentified gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.unidentified

# give armor a mod if it doesn't have one
execute if score $unidentified gm4_ai_data matches 0 run function gm4_armor_identification:armor/identify/pick_mod

# calculate health if needed
execute if score $unidentified gm4_ai_data matches 4..5 run function gm4_armor_identification:player/calculate_hp

# check if armor should be identified
execute if score $unidentified gm4_ai_data matches 1 unless score @s gm4_ai_t_hurt matches 1.. run function gm4_armor_identification:armor/identify/check_mod/safe
execute if score $unidentified gm4_ai_data matches 2 if score @s gm4_ai_t_hurt matches 3.. run function gm4_armor_identification:armor/identify/check_mod/unsafe
execute if score $unidentified gm4_ai_data matches 3 if score @s gm4_ai_t_kill matches 1.. run function gm4_armor_identification:armor/identify/check_mod/killing
execute if score $unidentified gm4_ai_data matches 4 if score @s gm4_ai_health < $half_health gm4_ai_data run function gm4_armor_identification:armor/identify/check_mod/lowhp
execute if score $unidentified gm4_ai_data matches 5 if score @s gm4_ai_health > $half_health gm4_ai_data run function gm4_armor_identification:armor/identify/check_mod/highhp
execute if score $unidentified gm4_ai_data matches 6 if predicate gm4_armor_identification:technical/night_time run function gm4_armor_identification:armor/identify/check_mod/night
execute if score $unidentified gm4_ai_data matches 7 run function gm4_armor_identification:armor/identify/check_mod/equip
