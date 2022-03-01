# run from armor/modifiers/type/thorns/check

# mark for change and set to active
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 0

# get level
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level

# grab old thorns from storage and reset
data modify storage gm4_armor_identification:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set from storage gm4_armor_identification:temp tag.gm4_armor_identification.thorns
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.thorns set value 0

# use lib_lore to remove lore lines and reveal enchantments
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
execute if score $level gm4_ai_data matches 1 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XIV"},{"translate":"item.gm4_armor_identification.armor.lore.thorns_lvl1"}]}'
execute if score $level gm4_ai_data matches 2 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVI"},{"translate":"item.gm4_armor_identification.armor.lore.thorns_lvl2"}]}'
execute if score $level gm4_ai_data matches 3 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVIII"},{"translate":"item.gm4_armor_identification.armor.lore.thorns_lvl3"}]}'
execute if score $level gm4_ai_data matches 4 run data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XX"},{"translate":"item.gm4_armor_identification.armor.lore.thorns_lvl4"}]}'
function #gm4_lore:remove
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source
data modify storage gm4_armor_identification:temp tag.HideFlags set value 0
