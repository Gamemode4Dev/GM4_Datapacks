# process the leggings
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_armor_expanded:temp components set from storage gm4_armor_expanded:temp Items[{Slot:2b}].components
execute store result score $modifier gm4_ae_data run data get storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.modifier 100

# check netherite
execute if predicate gm4_armor_expanded:technical/convert_netherite/legs run function gm4_armor_expanded:armor/convert_netherite

# check modifier
execute if score $modifier gm4_ae_data matches 100.. run function gm4_armor_expanded:armor/modifier/check_modifier

# make changes
execute if score $change gm4_ae_data matches 1 run function gm4_armor_expanded:item_modify_eval/legs_update with storage gm4_armor_expanded:temp
execute if score $change gm4_ae_data matches 1 run function gm4_armor_expanded:armor/slot/silence_equip_sound
