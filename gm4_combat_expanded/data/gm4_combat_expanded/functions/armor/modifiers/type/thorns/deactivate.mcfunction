# deactivate active thorns armor
# @s = player wearing armour
# run from armor/modifiers/type/thorns/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# grab old thorns from storage and reset
data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set from storage gm4_combat_expanded:temp tag.gm4_combat_expanded.thorns
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.thorns set value 0

# use lib_lore to remove lore lines and reveal enchantments
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XIV"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl1"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XV"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl2"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVI"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl3"}]}'
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVII"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl4"}]}'
function #gm4_lore:remove
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
data modify storage gm4_combat_expanded:temp tag.HideFlags set value 0
