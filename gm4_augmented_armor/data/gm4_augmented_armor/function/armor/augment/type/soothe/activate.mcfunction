# activate heal pulse
# @s = player wearing soothing armour
# at @s
# run from armor/augment/type/soothe/check

# mark for change and set to active
scoreboard players set $change gm4_aa_data 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.active set value 1

# healing pulse effects
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 run effect give @e[type=!player,distance=..2.75,tag=!smithed.strict] instant_health 1 0
execute if score $level gm4_aa_data matches 2 run effect give @e[type=!player,distance=..4.5,tag=!smithed.strict] instant_health 1 1
execute if score $level gm4_aa_data matches 3 run effect give @e[type=!player,distance=..6.25,tag=!smithed.strict] instant_health 1 2
effect give @a[distance=..6.5] regeneration 2 4
execute if score $level gm4_aa_data matches 2 run effect give @a[distance=..4.5] instant_health 1 0
execute if score $level gm4_aa_data matches 3 run effect give @a[distance=..6.25] instant_health 1 1

# healing pulse particles and sound
playsound minecraft:block.conduit.activate player @a ~ ~ ~ 1 2
execute positioned ~ ~.6 ~ summon marker at @s run function gm4_augmented_armor:armor/augment/type/soothe/particles

# use lib_lore to darken the 'Heal Pulse' text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
execute if score $level gm4_aa_data matches 1 run data modify storage gm4_lore:temp Target set value '{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.0"}]}'
execute if score $level gm4_aa_data matches 2 run data modify storage gm4_lore:temp Target set value '{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.1"}]}'
execute if score $level gm4_aa_data matches 3 run data modify storage gm4_lore:temp Target set value '{"color":"blue","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.2"}]}'
execute if score $level gm4_aa_data matches 1 run data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.0"}]}','{"text":"NaN"}']
execute if score $level gm4_aa_data matches 2 run data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.1"}]}','{"text":"NaN"}']
execute if score $level gm4_aa_data matches 3 run data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","italic":false,"translate":"potion.withAmplifier","with":[{"fallback":"Heal Pulse","translate":"item.gm4.augmented_armor.lore.soothe"},{"translate":"potion.potency.2"}]}','{"text":"NaN"}']
function #gm4_lore:replace
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source

# update recharge text
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.recharge set value 0
scoreboard players set $max_charge gm4_aa_data 35
execute store result score $level_2 gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.max_charge int 1 run scoreboard players operation $max_charge gm4_aa_data -= $level_2 gm4_aa_data
function gm4_augmented_armor:armor/augment/type/soothe/recharge_text with storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor

# set cooldown
scoreboard players set @s gm4_aa_augment.soothe.timer 2