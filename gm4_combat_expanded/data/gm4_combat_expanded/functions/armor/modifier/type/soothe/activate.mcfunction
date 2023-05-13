# activate heal pulse
# @s = player wearing soothing armour
# at @s
# run from armor/modifier/type/soothe/health_check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# store current day in data
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.day int 1 run scoreboard players get $day gm4_ce_data

# healing pulse effects
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run effect give @e[type=!player,distance=..2.75,tag=!smithed.strict] instant_health 1 0
execute if score $level gm4_ce_data matches 2 run effect give @e[type=!player,distance=..4.5,tag=!smithed.strict] instant_health 1 1
execute if score $level gm4_ce_data matches 3 run effect give @e[type=!player,distance=..6.25,tag=!smithed.strict] instant_health 1 2
effect give @a[distance=..6.5] regeneration 2 4
execute if score $level gm4_ce_data matches 2 run effect give @a[distance=..4.5] instant_health 1 0
execute if score $level gm4_ce_data matches 3 run effect give @a[distance=..6.25] instant_health 1 1

# healing pulse particles and sound
playsound minecraft:block.conduit.activate player @a ~ ~ ~ 1 2
summon marker ~ ~0.6 ~ {Tags:["gm4_ce_soothe_pulse"]}
execute as @e[type=marker,tag=gm4_ce_soothe_pulse] at @s run function gm4_combat_expanded:armor/modifier/type/soothe/particles

# use lib_lore to darken the 'Heal Pulse' text
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp tag.display.Lore
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.0"}]}'
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.1"}]}'
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Target set value '{"italic":false,"color":"blue","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.2"}]}'
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"italic":false,"color":"dark_gray","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.0"}]}']
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"italic":false,"color":"dark_gray","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.1"}]}']
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"italic":false,"color":"dark_gray","translate":"potion.withAmplifier","with":[{"translate":"%1$s%3427655$s","with":[{"text":"Heal Pulse"},{"translate":"item.gm4.combat_expanded.lore.soothe"}]},{"translate":"potion.potency.2"}]}']
function #gm4_lore:replace
data modify storage gm4_combat_expanded:temp tag.display.Lore set from storage gm4_lore:temp Source

# set cooldown
scoreboard players set @s gm4_ce_t_soothe 1
