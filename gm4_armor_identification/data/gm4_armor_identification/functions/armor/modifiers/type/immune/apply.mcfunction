# run from armor/modifiers/type/immune/check
# @s = player wearing immune armour above 50% health

# get levels
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level
execute store result score $level2 gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level2

# give effects
execute if score $level gm4_ai_data matches 1 run effect clear @s poison
execute if score $level gm4_ai_data matches 2 run effect clear @s wither
execute if score $level gm4_ai_data matches 3 run effect clear @s mining_fatigue

execute if score $level2 gm4_ai_data matches 1 run effect clear @s hunger
execute if score $level2 gm4_ai_data matches 2 run effect clear @s blindness
execute if score $level2 gm4_ai_data matches 3 run effect clear @s nausea
execute if score $level2 gm4_ai_data matches 4 run effect clear @s weakness
