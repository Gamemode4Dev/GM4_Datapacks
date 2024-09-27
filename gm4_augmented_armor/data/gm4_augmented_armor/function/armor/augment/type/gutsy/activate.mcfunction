# activate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from armor/augment/type/berserk/check

# mark for change and set to active
scoreboard players set $change gm4_aa_data 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.active set value 1

# modify attributes
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 5
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 5
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 5
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 5

# modify custom attribute
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage int 1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
