# calculate how much armor this piece gives
# @s = player wearing convert armor
# at @s
# run from armor/augment/type/convert/update

# calc total armor this piece is giving
scoreboard players set $armor_total gm4_aa_data 0
data modify storage gm4_augmented_armor:temp attribute_modifiers set from storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers
function gm4_augmented_armor:armor/augment/type/convert/loop_attribute_modifiers
data remove storage gm4_augmented_armor:temp check_modifier

# if value is 0 no need to change it
execute if score $armor_total gm4_aa_data matches 0 run return 0

# get current armor negation
execute store result score $armor_negation gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:permanent_2"}].amount -1

# modify to give 0 armor and convert it to health
scoreboard players set $change gm4_aa_data 1
scoreboard players operation $armor_negation gm4_aa_data += $armor_total gm4_aa_data
execute store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:permanent_2"}].amount int -1 run scoreboard players get $armor_negation gm4_aa_data
execute store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:permanent"}].amount int 1 run scoreboard players get $armor_negation gm4_aa_data
