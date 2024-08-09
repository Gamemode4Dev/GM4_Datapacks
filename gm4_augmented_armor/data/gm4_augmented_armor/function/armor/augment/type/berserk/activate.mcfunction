# activate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from armor/augment/type/berserk/check

# mark for change and set to active
scoreboard players set $change gm4_aa_data 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.active set value 1

# modify attributes
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10

execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_2"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_2"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_2"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_2"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]

execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_3"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[2]
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_3"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[2]
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_3"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[2]
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_3"}].amount float 0.01 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[2]

execute if score $slot gm4_aa_data matches 0 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_4"}].amount set value 0.1
execute if score $slot gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_4"}].amount set value 0.1
execute if score $slot gm4_aa_data matches 2 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_4"}].amount set value 0.1
execute if score $slot gm4_aa_data matches 3 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_4"}].amount set value 0.1
