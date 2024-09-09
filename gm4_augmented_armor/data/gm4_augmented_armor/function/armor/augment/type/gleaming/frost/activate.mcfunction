
scoreboard players operation $gleaming.frost gm4_aa_data = @s gm4_aa_augment.gleaming.frost

execute store result storage gm4_augmented_armor:temp gleaming.frost_damage float 0.1 run scoreboard players get $gleaming.frost gm4_aa_data

tag @s add gm4_aa_augment_damager
execute as @e[predicate=gm4_augmented_armor:technical/pvp_able,distance=..5] run function gm4_augmented_armor:armor/augment/type/gleaming/frost/damage with storage gm4_augmented_armor:temp gleaming
tag @s remove gm4_aa_augment_damager

# cleanup
data remove storage gm4_augmented_armor:temp gleaming
