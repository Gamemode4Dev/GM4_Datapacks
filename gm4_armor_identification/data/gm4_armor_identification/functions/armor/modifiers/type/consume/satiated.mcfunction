# run from armor/active/consume/grow
# @s = player wearing the armor
# at @s

# set level to cap
scoreboard players operation $level gm4_ai_data = $cap gm4_ai_data

# check what name the armor should have and replace if unchanged
execute store result score $namelen gm4_ai_data run data get storage gm4_armor_identification:temp tag.display.Name
execute if score $namelen gm4_ai_data matches 75.. run function gm4_armor_identification:armor/modifiers/type/consume/rename

# remove module tag to stop clock running for this armor
data remove storage gm4_armor_identification:temp tag.gm4_armor_identification

# use lib_lore to remove lore lines
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
data modify storage gm4_lore:temp Target set value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"When Killing:"},{"translate":"item.gm4_armor_identification.armor.lore.killing"}]}'
scoreboard players set $start gm4_lore -1
scoreboard players set $extra gm4_lore 2
function #gm4_lore:remove
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source

# effects
playsound minecraft:entity.vex.charge player @s ~ ~ ~ 0.8 0.5
particle soul ~ ~1.2 ~ 0.3 0.75 0.3 0.01 4
