# run from armor/modifiers/type/witch/check
# @s = player wearing witch armour

# use lib_lore to brighten the 'Release Potion' text
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Release Potion"},{"translate":"item.gm4.mob_buff.armor.lore.witch"}]}'
data modify storage gm4_lore:temp Input set value ['{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Release Potion"},{"translate":"item.gm4.mob_buff.armor.lore.witch"}]}']
function #gm4_lore:replace
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source
