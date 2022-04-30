# check moon phase and time of day
# @s = player wearing armour
# run from armor/check_modifier

# get moon cycle (0 = full moon)
execute store result score $moon gm4_ce_data run time query day
scoreboard players operation $moon gm4_ce_data %= #8 gm4_ce_data

# deactivate during the day
execute if score $active gm4_ce_data matches 1 unless predicate gm4_combat_evolved:technical/night_time run function gm4_combat_evolved:armor/modifiers/type/lunar/deactivate

# reactivate if moon cycle isn't correct
execute store result score $stored_moon gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.moon
execute if score $active gm4_ce_data matches 1 unless score $moon gm4_ce_data = $stored_moon gm4_ce_data if predicate gm4_combat_evolved:technical/night_time run function gm4_combat_evolved:armor/modifiers/type/lunar/activate

# activate if night
execute if score $active gm4_ce_data matches 0 if predicate gm4_combat_evolved:technical/night_time run function gm4_combat_evolved:armor/modifiers/type/lunar/activate
