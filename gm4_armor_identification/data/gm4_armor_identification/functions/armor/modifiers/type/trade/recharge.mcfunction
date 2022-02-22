# run from armor/modifiers/type/trade/check
# @s = player wearing trade armour

# mark for change and set to inactive
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 0

# use lib_lore to brighten the 'Spawn Trader' text
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Spawn Trader"},{"translate":"item.gm4.mob_buff.armor.lore.trade"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Spawn Trader"},{"translate":"item.gm4.mob_buff.armor.lore.trade"}]}']
function #gm4_lore:replace
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source
