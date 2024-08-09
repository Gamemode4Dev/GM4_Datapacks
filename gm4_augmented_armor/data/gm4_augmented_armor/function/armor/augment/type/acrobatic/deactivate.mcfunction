# deactivate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/augment/type/acrobatic/check

# mark for change and set to inactive
scoreboard players set $change gm4_aa_data 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.active set value 0

# disable attribute
execute if score $slot gm4_aa_data matches 0 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 2 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 3 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount set value 0
