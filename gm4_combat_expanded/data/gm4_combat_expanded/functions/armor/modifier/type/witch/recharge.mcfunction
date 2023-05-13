# recharge witch armor piece when cooldown finishes
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/witch/tick_cooldown

# use lib_lore to brighten the 'Discharge' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Discharge"},{"translate":"item.gm4.combat_expanded.lore.witch"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Discharge"},{"translate":"item.gm4.combat_expanded.lore.witch"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
