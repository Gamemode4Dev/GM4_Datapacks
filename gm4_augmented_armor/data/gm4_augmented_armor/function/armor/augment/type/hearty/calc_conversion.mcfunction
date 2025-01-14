# calculate how much armor this piece gives
# @s = player wearing hearty armor
# at @s
# run from armor/augment/type/hearty/update

# calc total armor this piece is giving
scoreboard players set $armor_total gm4_aa_data 0
data modify storage gm4_augmented_armor:temp attribute_modifiers set from storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers
function gm4_augmented_armor:armor/augment/type/hearty/loop_attribute_modifiers
data remove storage gm4_augmented_armor:temp check_modifier

# if value is 0 no need to change it
execute if score $armor_total gm4_aa_data matches 0 run return 0

# get current armor negation
execute if score $slot gm4_aa_data matches 0 store result score $armor_negation gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_2"}].amount -1
execute if score $slot gm4_aa_data matches 1 store result score $armor_negation gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_2"}].amount -1
execute if score $slot gm4_aa_data matches 2 store result score $armor_negation gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_2"}].amount -1
execute if score $slot gm4_aa_data matches 3 store result score $armor_negation gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_2"}].amount -1

# modify to give 0 armor and convert it to health
scoreboard players set $change gm4_aa_data 1
scoreboard players operation $armor_negation gm4_aa_data += $armor_total gm4_aa_data
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_2"}].amount int -1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_2"}].amount int -1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_2"}].amount int -1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_2"}].amount int -1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount int 1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount int 1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount int 1 run scoreboard players get $armor_negation gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount int 1 run scoreboard players get $armor_negation gm4_aa_data
