# run from armor/check_modifier
# @s = player wearing lunar armour

# get moon cycle (0 = full moon)
execute store result score $moon gm4_ai_data run time query day
scoreboard players operation $moon gm4_ai_data %= #8 gm4_ai_data

# deactivate during the day
execute if score $active gm4_ai_data matches 1 unless predicate gm4_armor_identification:technical/night_time run function gm4_armor_identification:armor/modifiers/type/lunar/deactivate

# reactivate if moon cycle isn't correct
execute store result score $stored_moon gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.moon
execute if score $active gm4_ai_data matches 1 unless score $moon gm4_ai_data = $stored_moon gm4_ai_data if predicate gm4_armor_identification:technical/night_time run function gm4_armor_identification:armor/modifiers/type/lunar/activate

# activate if night
execute if score $active gm4_ai_data matches 0 if predicate gm4_armor_identification:technical/night_time run function gm4_armor_identification:armor/modifiers/type/lunar/activate
