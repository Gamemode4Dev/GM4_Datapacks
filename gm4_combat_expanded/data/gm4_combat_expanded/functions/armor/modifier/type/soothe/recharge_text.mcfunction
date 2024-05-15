
# use lib_lore to remove the old rechrage text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"When Low on Health:","italic":false,"translate":"item.gm4.combat_expanded.lore.low_hp"}'
scoreboard players set $start gm4_lore 2
function #gm4_lore:remove

# use lib_lore to update the rechrage text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"When Low on Health:","italic":false,"translate":"item.gm4.combat_expanded.lore.low_hp"}'
$data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","fallback":"Kills: %s/%s","italic":false,"translate":"item.gm4.combat_expanded.lore.soothe_recharge","with":["$(recharge)","$(max_charge)"]}']
scoreboard players set $start gm4_lore 2
function #gm4_lore:insert

data modify storage gm4_combat_expanded:temp components."minecraft:lore" set from storage gm4_lore:temp Source
