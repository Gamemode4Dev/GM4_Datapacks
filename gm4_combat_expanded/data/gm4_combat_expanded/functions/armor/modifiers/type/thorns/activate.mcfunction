# activate inactive thorns armor
# @s = player wearing armour
# run from armor/modifiers/type/thorns/check

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
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XIV"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl1"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XV"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl2"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVI"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl3"}]}'
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"gray","text":"Thorns XVII"},{"translate":"item.gm4.combat_expanded.lore.thorns_lvl4"}]}'
data modify storage gm4_combat_expanded:temp tag.HideFlags set value 1
