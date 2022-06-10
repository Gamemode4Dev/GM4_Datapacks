# invisibility and jump boost and undamaged
# @s = player wearing armor
# run from armor/check_modifier

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
effect give @s invisibility 1 0 true
execute if score $level gm4_ce_data matches 1..2 run effect give @s jump_boost 1 0 true
execute if score $level gm4_ce_data matches 3..4 run effect give @s jump_boost 1 1 true
