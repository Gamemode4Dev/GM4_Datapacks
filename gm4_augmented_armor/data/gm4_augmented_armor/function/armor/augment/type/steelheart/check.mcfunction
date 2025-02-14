
# check what regeneration speed this player would have without this armor
execute store result score $mod_regeneration_speed gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed.value
scoreboard players operation $current_regeneration_speed gm4_aa_data = @s gm4_sr_stat.regeneration_rate_base
scoreboard players operation $current_regeneration_speed gm4_aa_data += @s gm4_sr_stat.regeneration_rate_change
scoreboard players operation $current_regeneration_speed gm4_aa_data -= $mod_regeneration_speed gm4_aa_data

# check if the armor already gives the right amount of regeneration reduction
scoreboard players set $regeneration_speed_set gm4_aa_data 0
scoreboard players operation $regeneration_speed_set gm4_aa_data -= $current_regeneration_speed gm4_aa_data
execute if score $regeneration_speed_set gm4_aa_data = $mod_regeneration_speed gm4_aa_data run return 0

# update player score
scoreboard players operation @s gm4_sr_stat.regeneration_rate_change -= $mod_regeneration_speed gm4_aa_data
scoreboard players operation @s gm4_sr_stat.regeneration_rate_change += $regeneration_speed_set gm4_aa_data

# otherwise update the armor
execute store result score $armor_recharge_set gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] -25
scoreboard players operation $armor_recharge_set gm4_aa_data *= $regeneration_speed_set gm4_aa_data

# update the custom attributes
scoreboard players set $change gm4_aa_data 1
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed.value int 1 run scoreboard players get $regeneration_speed_set gm4_aa_data
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value int 0.01 run scoreboard players get $armor_recharge_set gm4_aa_data

# use lib_lore to remove the old current bonus text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Steelheart","translate":"item.gm4.augmented_armor.augment.steelheart"}]}'
scoreboard players set $start gm4_lore 4
scoreboard players set $extra gm4_lore 1
function #gm4_lore:remove

# use lib_lore to update the current bonus text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Steelheart","translate":"item.gm4.augmented_armor.augment.steelheart"}]}'
execute store result storage gm4_augmented_armor:temp set.regen_speed int -1 run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed.value
data modify storage gm4_augmented_armor:temp set.armor_recharge set from storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value
function gm4_augmented_armor:armor/augment/type/steelheart/eval_lore with storage gm4_augmented_armor:temp set
data remove storage gm4_augmented_armor:temp set
scoreboard players set $start gm4_lore 4
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source
