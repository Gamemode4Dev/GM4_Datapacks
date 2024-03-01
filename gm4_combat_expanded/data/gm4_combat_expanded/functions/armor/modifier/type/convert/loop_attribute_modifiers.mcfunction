# loop over armor modifiers to add together armor values
# @s = player wearing convert armor
# at @s
# run from armor/modifier/type/convert/calc_conversion
# run from here

# check modifier to see armor it grants
data modify storage gm4_combat_expanded:temp check_modifier set from storage gm4_combat_expanded:temp AttributeModifiers[0]
execute store result score $armor_add gm4_ce_data run data get storage gm4_combat_expanded:temp check_modifier{AttributeName:"minecraft:generic.armor"}.Amount
scoreboard players operation $armor_total gm4_ce_data += $armor_add gm4_ce_data

# loop over all modifiers
data remove storage gm4_combat_expanded:temp AttributeModifiers[0]
execute if data storage gm4_combat_expanded:temp AttributeModifiers[0] run function gm4_combat_expanded:armor/modifier/type/convert/loop_attribute_modifiers
