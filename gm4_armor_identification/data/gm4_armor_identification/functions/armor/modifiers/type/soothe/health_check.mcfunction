# run from armor/modifiers/type/soothe/check
# @s = player wearing soothing armour
# at @s

function gm4_armor_identification:player/calculate_hp

execute if score @s gm4_ai_health < $half_health gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/soothe/activate
