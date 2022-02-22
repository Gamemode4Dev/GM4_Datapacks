# run from armor/check_modifier
# @s = player being checked

function gm4_armor_identification:player/calculate_hp

execute if score @s gm4_ai_health > $half_health gm4_ai_data if score $active gm4_ai_data matches 0 run function gm4_armor_identification:armor/modifiers/type/husk/apply
