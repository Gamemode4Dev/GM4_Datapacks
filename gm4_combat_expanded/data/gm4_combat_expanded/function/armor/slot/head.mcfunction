# process the helmet
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp Items[{Slot:0b}].components
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.modifier 100

# check netherite
execute if predicate gm4_combat_expanded:technical/convert_netherite/head run function gm4_combat_expanded:armor/convert_netherite

# check modifier
execute if score $modifier gm4_ce_data matches 100.. run function gm4_combat_expanded:armor/modifier/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:item_modify_eval/head_update with storage gm4_combat_expanded:temp
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
