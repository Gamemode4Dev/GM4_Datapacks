# run from armor/modifiers/type/immune/check
# @s = player wearing immune armour above 50% health

# get levels
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
execute store result score $level2 gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2

# give effects
execute if score $level gm4_ce_data matches 1 run effect clear @s poison
execute if score $level gm4_ce_data matches 2 run effect clear @s wither
execute if score $level gm4_ce_data matches 3 run effect clear @s mining_fatigue

execute if score $level2 gm4_ce_data matches 1 run effect clear @s hunger
execute if score $level2 gm4_ce_data matches 2 run effect clear @s blindness
execute if score $level2 gm4_ce_data matches 3 run effect clear @s nausea
execute if score $level2 gm4_ce_data matches 4 run effect clear @s weakness
