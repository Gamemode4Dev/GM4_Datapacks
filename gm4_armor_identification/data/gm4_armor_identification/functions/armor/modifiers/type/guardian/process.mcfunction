# run from armor/check_modifier
# @s = player guarding

function gm4_armor_identification:player/calculate_hp

execute if score @s gm4_ai_health >= $half_health gm4_ai_data unless score @s gm4_ai_t_guard matches 1.. at @s run function gm4_armor_identification:armor/modifiers/type/guardian/activate
