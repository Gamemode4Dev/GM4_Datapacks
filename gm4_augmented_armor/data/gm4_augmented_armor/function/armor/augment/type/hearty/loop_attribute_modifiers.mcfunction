# loop over armor modifiers to add together armor values
# @s = player wearing hearty armor
# at @s
# run from armor/augment/type/hearty/calc_conversion
# run from here

# check augment to see armor it grants
data modify storage gm4_augmented_armor:temp check_modifier set from storage gm4_augmented_armor:temp attribute_modifiers[0]
execute store result score $armor_add gm4_aa_data run data get storage gm4_augmented_armor:temp check_modifier{type:"minecraft:generic.armor"}.amount
scoreboard players operation $armor_total gm4_aa_data += $armor_add gm4_aa_data

# loop over all modifiers
data remove storage gm4_augmented_armor:temp attribute_modifiers[0]
execute if data storage gm4_augmented_armor:temp attribute_modifiers[0] run function gm4_augmented_armor:armor/augment/type/hearty/loop_attribute_modifiers
