
scoreboard players operation $gleaming.luminous gm4_aa_data = @s gm4_aa_augment.gleaming.luminous

execute unless score $gleaming.luminous gm4_aa_data matches 10.. store result storage gm4_augmented_armor:temp gleaming.luminous_damage float 0.2 run scoreboard players get $gleaming.luminous gm4_aa_data
execute if score $gleaming.luminous gm4_aa_data matches 10.. store result storage gm4_augmented_armor:temp gleaming.luminous_damage float 0.4 run scoreboard players get $gleaming.luminous gm4_aa_data

tag @s add gm4_aa_augment_damager
execute as @e[predicate=gm4_augmented_armor:technical/pvp_able,distance=..5] run function gm4_augmented_armor:armor/augment/type/gleaming/luminous/damage with storage gm4_augmented_armor:temp gleaming
tag @s remove gm4_aa_augment_damager

# cleanup
data remove storage gm4_augmented_armor:temp gleaming
