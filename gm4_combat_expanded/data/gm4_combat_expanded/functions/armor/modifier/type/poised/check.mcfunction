# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/hp_check

# activate attributes if player above 50% health
execute if score @s gm4_ce_health > $half_health gm4_ce_data unless score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/poised/high_hp

# activate attributes if player below 50% health
execute if score @s gm4_ce_health <= $half_health gm4_ce_data unless score $active gm4_ce_data matches -1 run function gm4_combat_expanded:armor/modifier/type/poised/low_hp
