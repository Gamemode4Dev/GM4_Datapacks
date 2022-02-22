# run from armor/modifiers/type/soothe/health_check
# @s = player wearing soothing armour
# at @s

# mark for change and set to active
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 1

# store current day in data
execute store result storage gm4_armor_identification:temp tag.gm4_armor_identification.day int 1 run scoreboard players get $day gm4_ai_data

# healing pulse effects
execute store result score $level gm4_ai_data run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level
execute if score $level gm4_ai_data matches 1 run effect give @e[type=!player,distance=..1.75] instant_health 1 0
execute if score $level gm4_ai_data matches 2 run effect give @e[type=!player,distance=..2.25] instant_health 1 1
execute if score $level gm4_ai_data matches 3 run effect give @e[type=!player,distance=..3] instant_health 1 2
effect give @a[distance=..3] regeneration 4 2
execute if score $level gm4_ai_data matches 2 run effect give @a[distance=..2.25] instant_health 1 0
execute if score $level gm4_ai_data matches 3 run effect give @a[distance=..3] instant_health 1 1

# healing pulse particles
summon marker ~ ~0.6 ~ {Tags:["gm4_ai_soothe_pulse"]}
execute as @e[type=marker,tag=gm4_ai_soothe_pulse] at @s run function gm4_armor_identification:armor/modifiers/type/soothe/particles

# use lib_lore to darken the 'Heal Pulse' text
data modify storage gm4_lore:temp Source set from storage gm4_armor_identification:temp tag.display.Lore
execute if score $level gm4_ai_data matches 1 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]}]}'
execute if score $level gm4_ai_data matches 2 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"blue","translate":"potion.potency.1"}]}'
execute if score $level gm4_ai_data matches 3 run data modify storage gm4_lore:temp Target set value '{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"blue","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"blue","translate":"potion.potency.2"}]}'
execute if score $level gm4_ai_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]}]}']
execute if score $level gm4_ai_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"dark_gray","translate":"potion.potency.1"}]}']
execute if score $level gm4_ai_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"italic":false,"color":"dark_gray","text":"Heal Pulse"},{"translate":"item.gm4.mob_buff.armor.lore.fear"}]},{"italic":false,"color":"dark_gray","translate":"potion.potency.2"}]}']
function #gm4_lore:replace
data modify storage gm4_armor_identification:temp tag.display.Lore set from storage gm4_lore:temp Source

# set cooldown
scoreboard players set @s gm4_ai_t_soothe 1
