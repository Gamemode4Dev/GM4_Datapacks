# run from armor/modifiers/type/trade/check
# @s = player wearing trade armour

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.active set value 0

# use lib_lore to brighten the 'Clientele' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_evolved:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Clientele"},{"translate":"item.gm4.combat_evolved.lore.trade"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Clientele"},{"translate":"item.gm4.combat_evolved.lore.trade"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_evolved:temp tag.display.Lore set from storage gm4_lore:temp Source
