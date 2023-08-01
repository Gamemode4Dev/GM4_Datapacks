# activate inactive thorns armor
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/thorns/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# store old thorns in level and set new level
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.thorns set from storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set value 14
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set value 15
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set value 16
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:thorns"}].lvl set value 17

# hide enchantments and use fake lore instead
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.14","fallback":"XIV"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.15","fallback":"XV"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.16","fallback":"XVI"}]}'
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"italic":false,"color":"gray","translate":"potion.withAmplifier","with":[{"translate":"enchantment.minecraft.thorns"},{"translate":"enchantment.level.17","fallback":"XVII"}]}'

execute store result score $hideflags gm4_ce_data run data get storage gm4_combat_expanded:temp tag.HideFlags
scoreboard players operation $hideflag_present gm4_ce_data = $hideflags gm4_ce_data
scoreboard players operation $hideflag_present gm4_ce_data %= #2 gm4_ce_data
execute if score $hideflag_present gm4_ce_data matches 0 store result storage gm4_combat_expanded:temp tag.HideFlags short 1 run scoreboard players add $hideflags gm4_ce_data 1
execute if score $hideflag_present gm4_ce_data matches 0 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.flags_changed set value 1
