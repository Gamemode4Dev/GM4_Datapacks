
# use lib_lore to remove the old rechrage text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"item.gm4.combat_expanded.lore.low_hp","fallback":"When Low on Health:","italic":false,"color":"gray"}'
scoreboard players set $start gm4_lore 2
function #gm4_lore:remove

# use lib_lore to update the rechrage text
data modify storage gm4_lore:temp Target set value '{"translate":"item.gm4.combat_expanded.lore.low_hp","fallback":"When Low on Health:","italic":false,"color":"gray"}'
$data modify storage gm4_lore:temp Input set value ['{"translate":"item.gm4.combat_expanded.lore.soothe_recharge","fallback":"Kills: %s/%s","with":["$(recharge)","$(max_charge)"],"italic":false,"color":"dark_gray"}']
scoreboard players set $start gm4_lore 2
function #gm4_lore:insert

data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
