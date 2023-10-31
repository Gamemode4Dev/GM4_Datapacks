# recharge witch armor piece when cooldown finishes
# @s = player wearing armour
# at unspecified
# run from armor/modifier/type/witch/tick_cooldown

# use lib_lore to brighten the 'Discharge' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"dark_gray","translate":"item.gm4.combat_expanded.lore.witch","fallback":"Discharge"}'
data modify storage gm4_lore:temp Input set value ['{"italic":false,"color":"blue","translate":"item.gm4.combat_expanded.lore.witch","fallback":"Discharge"}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
