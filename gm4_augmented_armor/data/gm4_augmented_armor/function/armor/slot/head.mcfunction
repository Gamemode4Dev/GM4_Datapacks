# process the helmet
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:0b}].components
execute store result score $modifier gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.modifier 100

# check netherite
execute if predicate gm4_augmented_armor:technical/convert_netherite/head run function gm4_augmented_armor:armor/convert_netherite

# check modifier
execute if score $modifier gm4_aa_data matches 100.. run function gm4_augmented_armor:armor/modifier/check_modifier

# make changes
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/head_update with storage gm4_augmented_armor:temp
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:armor/slot/silence_equip_sound
