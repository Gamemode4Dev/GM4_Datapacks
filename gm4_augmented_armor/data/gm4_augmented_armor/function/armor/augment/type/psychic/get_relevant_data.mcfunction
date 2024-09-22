# keep only data from psychic_armor
# @s = player wearing armor
# at unspecified
# run from armor/augment/type/psychic/prep
# run from here

execute if data storage gm4_augmented_armor:temp Items[0].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:psychic}} run data modify storage gm4_augmented_armor:temp psychic.data append from storage gm4_augmented_armor:temp Items[0]
data remove storage gm4_augmented_armor:temp Items[0]
execute if data storage gm4_augmented_armor:temp Items[0] run function gm4_augmented_armor:armor/augment/type/psychic/get_relevant_data
