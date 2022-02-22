# run from armor/modifiers/type/soothe/check
# @s = player wearing soothing armour
# at @s

# mark for change and set to inactive
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 0

# get heal pulse level
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level

# use lib_lore to brighten the 'Heal Pulse' text
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
execute if score $level gm4_ai_data matches 1 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]}]}'
execute if score $level gm4_ai_data matches 2 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"dark_gray","translate":"potion.potency.1"}]}'
execute if score $level gm4_ai_data matches 3 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"dark_gray","translate":"potion.potency.2"}]}'
execute if score $level gm4_ai_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]}]}']
execute if score $level gm4_ai_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"blue","translate":"potion.potency.1"}]}']
execute if score $level gm4_ai_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"blue","translate":"potion.potency.2"}]}']
function #gm4_lore:replace
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source
