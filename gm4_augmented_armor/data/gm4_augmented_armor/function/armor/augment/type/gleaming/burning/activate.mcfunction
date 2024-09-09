
scoreboard players operation $gleaming.burning gm4_aa_data = @s gm4_aa_augment.gleaming.burning

execute store result storage gm4_augmented_armor:temp gleaming.burning_damage float 0.3 run scoreboard players get $gleaming.burning gm4_aa_data

tag @s add gm4_aa_augment_damager
execute as @e[predicate=gm4_augmented_armor:technical/pvp_able,distance=..5] run function gm4_augmented_armor:armor/augment/type/gleaming/burning/damage with storage gm4_augmented_armor:temp gleaming
tag @s remove gm4_aa_augment_damager

# cleanup
data remove storage gm4_augmented_armor:temp gleaming
