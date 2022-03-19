# run from weapon/modifiers/delay/tick
# @s = entity damaged by delay
# at @s

# damage undead
execute if score $level gm4_ce_data matches 1 if predicate gm4_combat_evolved:mobs/undead run effect give @s instant_health 1 0
execute if score $level gm4_ce_data matches 2 if predicate gm4_combat_evolved:mobs/undead run effect give @s instant_health 1 1
execute if score $level gm4_ce_data matches 3 if predicate gm4_combat_evolved:mobs/undead run effect give @s instant_health 1 2
# damage living
execute if score $level gm4_ce_data matches 1 unless predicate gm4_combat_evolved:mobs/undead run effect give @s instant_damage 1 0
execute if score $level gm4_ce_data matches 2 unless predicate gm4_combat_evolved:mobs/undead run effect give @s instant_damage 1 1
execute if score $level gm4_ce_data matches 3 unless predicate gm4_combat_evolved:mobs/undead run effect give @s instant_damage 1 2
