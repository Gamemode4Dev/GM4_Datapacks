# invisibility and jump boost when undamaged
# @s = player wearing armor
# at world spawn
# run from armor/check_modifier/safe

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
effect give @s invisibility 2 0 true
execute if score $level gm4_ce_data matches 1..2 run effect give @s jump_boost 2 0 true
execute if score $level gm4_ce_data matches 3..4 run effect give @s jump_boost 2 1 true
