# process the leggings
# @s = player wearing the armor
# at unspecified
# run from armor/process

# store information
data modify storage gm4_combat_expanded:temp tag set from storage gm4_combat_expanded:temp Items[{Slot:2b}].tag
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier 100

# check netherite
execute if predicate gm4_combat_expanded:technical/convert_netherite/legs run function gm4_combat_expanded:armor/convert_netherite

# check modifier
execute if score $modifier gm4_ce_data matches 100.. run function gm4_combat_expanded:armor/modifier/check_modifier

# make changes
execute if score $change gm4_ce_data matches 1 run item modify entity @s armor.legs gm4_combat_expanded:update
execute if score $change gm4_ce_data matches 1 run function gm4_combat_expanded:armor/slot/silence_equip_sound
