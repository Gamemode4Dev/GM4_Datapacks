# check trade armor piece cooldown
# @s = player wearing armour
# at world spawn
# run from armor/check_modifier/equip

# refresh if a day has passed
execute store result score $day gm4_ce_data run time query day
execute store result score $stored_day gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.day
execute if score $active gm4_ce_data matches 1 unless score $day gm4_ce_data = $stored_day gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/trade/recharge

# spawn trader if ready
execute if score $active gm4_ce_data matches 0 at @s run function gm4_combat_expanded:armor/modifier/type/trade/spawn_attempt
