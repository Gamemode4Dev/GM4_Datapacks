# set sword stats when player is not sneaking
# @s = player wearing armor
# at unspecified
# run from armor/augment/type/psychic/prep

execute store result storage gm4_augmented_armor:temp psychic.scale float 0.1 run attribute @s minecraft:scale get 10
execute store result storage gm4_augmented_armor:temp psychic.height float 0.11 run data get storage gm4_augmented_armor:temp psychic.scale 10 
execute store result storage gm4_augmented_armor:temp psychic.offset float 0.1 run attribute @s minecraft:entity_interaction_range get 10
