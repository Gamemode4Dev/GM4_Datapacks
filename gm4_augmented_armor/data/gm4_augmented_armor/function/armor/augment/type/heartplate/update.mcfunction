# activate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/augment/type/acrobatic/check

scoreboard players set $change gm4_aa_data 1

execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_bonus int 1 run scoreboard players get @s gm4_sr_stat.max_health


execute store result score $regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute store result storage gm4_augmented_armor:temp set.regen_speed int 0.01 run scoreboard players operation $regen_speed gm4_aa_data *= @s gm4_sr_stat.max_health

# modify attribute
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed.value set from storage gm4_augmented_armor:temp set.regen_speed

# use lib_lore to remove the old current bonus text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Heartplate","translate":"item.gm4.augmented_armor.augment.heartplate"}]}'
scoreboard players set $start gm4_lore 3
function #gm4_lore:remove

# use lib_lore to update the current bonus text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Heartplate","translate":"item.gm4.augmented_armor.augment.heartplate"}]}'
function gm4_augmented_armor:armor/augment/type/heartplate/eval_lore with storage gm4_augmented_armor:temp set
scoreboard players set $start gm4_lore 3
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source

# cleanup
data remove storage gm4_augmented_armor:temp set
