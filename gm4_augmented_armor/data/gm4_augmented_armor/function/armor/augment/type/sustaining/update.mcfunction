# activate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/augment/type/acrobatic/check

scoreboard players set $change gm4_aa_data 1

execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_missing_hp int 1 run scoreboard players get $missing_health gm4_aa_data

execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $level gm4_aa_data *= $missing_health gm4_aa_data

# modify attribute
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed.value int 1 run scoreboard players get $level gm4_aa_data

# use lib_lore to remove the old current bonus text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Sustaining","translate":"item.gm4.augmented_armor.augment.sustaining"}]}'
scoreboard players set $start gm4_lore 2
function #gm4_lore:remove

# use lib_lore to update the current bonus text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Sustaining","translate":"item.gm4.augmented_armor.augment.sustaining"}]}'
function gm4_augmented_armor:armor/augment/type/sustaining/eval_lore with storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed
scoreboard players set $start gm4_lore 2
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source
