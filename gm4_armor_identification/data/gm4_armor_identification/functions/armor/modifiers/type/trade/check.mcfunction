# run from armor/check_modifier
# @s = player wearing trade armour

# refresh if a day has passed
execute store result score $day gm4_ai_data run time query day
execute store result score $stored_day gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.day
execute if score $active gm4_ai_data matches 1 unless score $day gm4_ai_data = $stored_day gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/trade/recharge

# spawn trader if ready
execute if score $active gm4_ai_data matches 0 at @s run function gm4_armor_identification:armor/modifiers/type/trade/spawn_attempt
