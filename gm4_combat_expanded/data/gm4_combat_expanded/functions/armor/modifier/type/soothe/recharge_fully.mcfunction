
# get level and mark as ready
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 0
execute at @s run playsound minecraft:block.conduit.activate player @s ~ ~ ~ 0.6 2

# use lib_lore to remove the rechrage text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"When Low on Health:","italic":false,"translate":"item.gm4.combat_expanded.lore.low_hp"}'
scoreboard players set $start gm4_lore 2
function #gm4_lore:remove

# use lib_lore to brighten the 'Heal Pulse' text
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Target set value '{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.0"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Target set value '{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.1"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Target set value '{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.2"}]}'
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.0"}]}']
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.1"}]}']
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.combat_expanded.lore.soothe"},{"translate":"potion.potency.2"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp components."minecraft:lore" set from storage gm4_lore:temp Source
