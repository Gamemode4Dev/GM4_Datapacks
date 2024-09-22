# process the boots
# @s = player wearing the armor
# at @s
# run from armor/get_armor

# store information
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:3b}].components
execute store result score $trigger.clocked gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.triggers.clocked
scoreboard players set $slot gm4_aa_data 3

# process augments that require processing
execute if score $trigger.clocked gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/clocked
execute if score $trigger.damage_dealt gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/damage_dealt
execute if score $trigger.damage_taken gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/damage_taken

# check netherite
execute if predicate gm4_augmented_armor:technical/convert_netherite/feet run function gm4_augmented_armor:armor/convert_netherite

# make changes
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/feet_update with storage gm4_augmented_armor:temp
