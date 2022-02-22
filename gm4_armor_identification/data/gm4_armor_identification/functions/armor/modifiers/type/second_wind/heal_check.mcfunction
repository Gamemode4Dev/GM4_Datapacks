# run from armor/modifiers/type/second_wind/check
# @s = player wearing second_wind piece

function gm4_armor_identification:player/calculate_hp

execute if score @s gm4_ai_health < $half_health gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/second_wind/heal_store
