# recharge trade armor piece if cooldown is over
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/trade/check

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0

# use lib_lore to brighten the 'Trade' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"dark_gray","translate":"item.gm4.combat_expanded.lore.trade","fallback":"Trade"}'
data modify storage gm4_lore:temp Input set value ['{"italic":false,"color":"blue","translate":"item.gm4.combat_expanded.lore.trade","fallback":"Trade"}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
