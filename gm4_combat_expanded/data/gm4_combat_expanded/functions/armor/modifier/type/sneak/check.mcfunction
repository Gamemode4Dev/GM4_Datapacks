# invisibility and jump boost when undamaged
# @s = player wearing armor
# at unspecified
# run from armor/check_modifier/safety

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# check for shrinking
execute if score $level gm4_ce_data matches 3..4 unless score @s gm4_ce_t_hurt matches 1.. if score $active gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/sneak/activate
execute if score $level gm4_ce_data matches 3..4 if score @s gm4_ce_t_hurt matches 1.. if score $active gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/sneak/deactivate

# invisiblity and jump boost effects
execute unless score @s gm4_ce_t_hurt matches 1.. run effect give @s invisibility 2 0 true
execute if score @s gm4_ce_t_hurt matches 1.. run scoreboard players set $level gm4_ce_data 0
execute if score $level gm4_ce_data matches 1 run effect give @s jump_boost 2 0 true
execute if score $level gm4_ce_data matches 3 run effect give @s jump_boost 2 0 true
execute if score $level gm4_ce_data matches 2 run effect give @s jump_boost 2 1 true
execute if score $level gm4_ce_data matches 4 run effect give @s jump_boost 2 1 true
