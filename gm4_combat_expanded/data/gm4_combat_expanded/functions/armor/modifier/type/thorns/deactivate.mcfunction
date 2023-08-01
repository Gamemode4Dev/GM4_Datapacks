# deactivate active thorns armor
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/thorns/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# grab old thorns from storage and reset
data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set from storage gm4_combat_expanded:temp tag.gm4_combat_expanded.thorns
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.thorns set value 0

# use lib_lore to remove lore lines and reveal enchantments
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.14","fallback":"XIV"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.15","fallback":"XV"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.16","fallback":"XVI"}]}'
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.17","fallback":"XVII"}]}'
function #gm4_lore:remove
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source

execute store result score $flags_changed gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.flags_changed
execute if score $flags_changed gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/thorns/restore_flags
