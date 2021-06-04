# @s = players holding an Audere tool
# at @s
# run from main

data modify storage gm4_audere_shamir:temp/player/tool SelectedItem set from entity @s SelectedItem
execute store result score $tool_current_damage gm4_ml_data run data get storage gm4_audere_shamir:temp/player/tool SelectedItem.tag.Damage
execute store result score $tool_max_damage gm4_ml_data run data get storage gm4_audere_shamir:temp/player/tool SelectedItem.tag.gm4_audere_shamir.max_durability

# update newly upgraded netherite gear
execute if score $tool_max_damage gm4_ml_data matches 1561 if predicate gm4_audere_shamir:holding_netherite run function gm4_audere_shamir:update_netherite

# activate audere
execute if score $tool_max_damage gm4_ml_data matches 59 run function gm4_audere_shamir:tools/materials/wood
execute if score $tool_max_damage gm4_ml_data matches 131 run function gm4_audere_shamir:tools/materials/stone
execute if score $tool_max_damage gm4_ml_data matches 250 run function gm4_audere_shamir:tools/materials/iron
execute if score $tool_max_damage gm4_ml_data matches 1561 run function gm4_audere_shamir:tools/materials/diamond
execute if score $tool_max_damage gm4_ml_data matches 2031 run function gm4_audere_shamir:tools/materials/netherite
execute if score $tool_max_damage gm4_ml_data matches 33 run function gm4_audere_shamir:tools/materials/gold
execute if score $tool_max_damage gm4_ml_data matches 237 run function gm4_audere_shamir:tools/shears

# reset storage and fake players
data remove storage gm4_audere_shamir:temp/player/tool SelectedItem
scoreboard players reset $tool_current_damage gm4_ml_data
scoreboard players reset $tool_max_damage gm4_ml_data
