# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_modifier/lowhp

# refresh if a day has passed
execute store result score $day gm4_ce_data run time query day
execute store result score $stored_day gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.day
execute if score $active gm4_ce_data matches 1 unless score $day gm4_ce_data = $stored_day gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/soothe/recharge

# check health if ready
execute if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/soothe/health_check
