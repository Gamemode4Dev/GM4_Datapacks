# recharge the heal pulse armor piece when cooldown is over
# @s = player wearing soothing armour
# at @s
# run from armor/modifier/type/soothe/check

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0

# get heal pulse level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# use lib_lore to brighten the 'Heal Pulse' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.0"}],"italic":false,"color":"dark_gray"}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.1"}],"italic":false,"color":"dark_gray"}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.2"}],"italic":false,"color":"dark_gray"}'
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.0"}],"italic":false,"color":"blue"}']
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.1"}],"italic":false,"color":"blue"}']
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"item.gm4.combat_expanded.lore.soothe","fallback":"Heal Pulse"},{"translate":"potion.potency.2"}],"italic":false,"color":"blue"}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source
