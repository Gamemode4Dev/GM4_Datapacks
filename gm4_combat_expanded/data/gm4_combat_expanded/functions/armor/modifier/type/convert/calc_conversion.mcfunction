# calculate how much armor this piece gives
# @s = player wearing convert armor
# at @s
# run from armor/modifier/type/convert/update

# calc total armor this piece is giving
scoreboard players set $armor_total gm4_ce_data 0
data modify storage gm4_combat_expanded:temp AttributeModifiers set from storage gm4_combat_expanded:temp tag.AttributeModifiers
function gm4_combat_expanded:armor/modifier/type/convert/loop_attribute_modifiers
data remove storage gm4_combat_expanded:temp check_modifier

# if value is 0 no need to change it
execute if score $armor_total gm4_ce_data matches 0 run return 0

# get current armor negation
execute store result score $armor_negation gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_ce_perm_2"}].Amount -1

# modify to give 0 armor and convert it to health
scoreboard players set $change gm4_ce_data 1
scoreboard players operation $armor_negation gm4_ce_data += $armor_total gm4_ce_data
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_ce_perm_2"}].Amount int -1 run scoreboard players get $armor_negation gm4_ce_data
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"gm4_ce_perm"}].Amount int 1 run scoreboard players get $armor_negation gm4_ce_data
