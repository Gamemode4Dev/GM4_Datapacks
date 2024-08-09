# process the boots
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:3b}].components
execute store result score $augment gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.id
scoreboard players set $slot gm4_aa_data 3

# check netherite
execute if predicate gm4_augmented_armor:technical/convert_netherite/feet run function gm4_augmented_armor:armor/convert_netherite

# check augment
execute if score $augment gm4_aa_data matches 1.. run function gm4_augmented_armor:armor/augment/check_augment

# make changes
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/feet_update with storage gm4_augmented_armor:temp
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:armor/slot/silence_equip_sound
