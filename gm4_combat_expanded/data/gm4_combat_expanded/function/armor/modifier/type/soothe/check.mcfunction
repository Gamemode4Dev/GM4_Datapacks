# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_modifier/hp_check

# recharge
execute if score $active gm4_ce_data matches 1 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/soothe/recharge

# check health if ready
execute unless score @s gm4_ce_t_soothe matches 1.. at @s if score $active gm4_ce_data matches 0 if score @s gm4_ce_health.current <= @s gm4_ce_health.max_half run function gm4_combat_expanded:armor/modifier/type/soothe/activate
