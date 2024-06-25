# invisibility and jump boost when undamaged
# @s = player wearing armor
# at unspecified
# run from armor/check_modifier/safety

# if armor is giving attack speed check if it should be removed
execute if score $active gm4_ce_data matches 2 run function gm4_combat_expanded:armor/modifier/type/sneak/check_time

# if armor was active and is now no longer grant the attack speed for 4 seconds if player is not hurt
execute if score $active gm4_ce_data matches 1 if score @s gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:armor/modifier/type/sneak/deactivate
execute if score $active gm4_ce_data matches 1 unless predicate gm4_combat_expanded:technical/crouching run function gm4_combat_expanded:armor/modifier/type/sneak/attack_speed

# check if player is sneaking while undamaged to grant invis
execute if score $active gm4_ce_data matches 0 unless score @s[predicate=gm4_combat_expanded:technical/crouching] gm4_ce_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/sneak/active
execute if score $active gm4_ce_data matches 1 run effect give @s invisibility 2 0 true
