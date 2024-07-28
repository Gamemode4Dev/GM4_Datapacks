# process the boots
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_combat_expanded_armor:temp components set from storage gm4_combat_expanded_armor:temp Items[{Slot:3b}].components
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded_armor:temp components."minecraft:custom_data".gm4_combat_expanded_armor.modifier 100

# check netherite
execute if predicate gm4_combat_expanded_armor:technical/convert_netherite/feet run function gm4_combat_expanded_armor:armor/convert_netherite

# check modifier
execute if score $modifier gm4_ce_data matches 100.. run function gm4_combat_expanded_armor:armor/modifier/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded_armor:item_modify_eval/feet_update with storage gm4_combat_expanded_armor:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded_armor:armor/slot/silence_equip_sound
