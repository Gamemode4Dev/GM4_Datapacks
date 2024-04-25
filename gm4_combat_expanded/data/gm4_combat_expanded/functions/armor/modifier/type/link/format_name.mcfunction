# format the link name to be purple and non-italic
# @s = player wearing link armor
# at @s
# run from armor/modifier/type/link/check

# replace the name with a formatted version
$data modify storage gm4_combat_expanded:temp components."minecraft:custom_name" set value '{"translate":"item.gm4.combat_expanded.name.link_no_translate","fallback":$(name),"italic":false,"color":"light_purple"}'
scoreboard players set $change gm4_ce_data 1

# armors active tag is used to track if armor was renamed before, if so no need to do so again
execute if score $active gm4_ce_data matches 1 run return 0
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 1

# use lib_lore to remove the 'Rename to Link' text and brighten the 'Lifelink' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"translate":"item.gm4.combat_expanded.lore.link_2","fallback":"Rename to Link","italic":false,"color":"blue"}'
function #gm4_lore:remove
data modify storage gm4_lore:temp Target set value '{"translate":"item.gm4.combat_expanded.lore.link_3","fallback":"Lifelink","italic":false,"color":"dark_gray"}'
data modify storage gm4_lore:temp Input set value ['{"translate":"item.gm4.combat_expanded.lore.link_3","fallback":"Lifelink","italic":false,"color":"blue"}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp components."minecraft:lore" set from storage gm4_lore:temp Source
