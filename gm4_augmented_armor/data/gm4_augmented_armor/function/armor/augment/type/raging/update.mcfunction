# activate the augments on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/augment/type/acrobatic/check

scoreboard players set $change gm4_aa_data 1

execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_bonus int 1 run scoreboard players get $bonus gm4_aa_data

scoreboard players set $damage_bonus gm4_aa_data 0

scoreboard players set $damage_bonus_add gm4_aa_data 0
execute if score $bonus gm4_aa_data matches 1.. store result score $damage_bonus_add gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $damage_bonus gm4_aa_data += $damage_bonus_add gm4_aa_data

scoreboard players set $damage_bonus_add gm4_aa_data 0
execute if score $bonus gm4_aa_data matches 2.. store result score $damage_bonus_add gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
scoreboard players operation $damage_bonus gm4_aa_data += $damage_bonus_add gm4_aa_data

scoreboard players set $damage_bonus_add gm4_aa_data 0
execute if score $bonus gm4_aa_data matches 3.. store result score $damage_bonus_add gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[2]
scoreboard players operation $damage_bonus gm4_aa_data += $damage_bonus_add gm4_aa_data

# modify attribute
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.1 run scoreboard players get $damage_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.1 run scoreboard players get $damage_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.1 run scoreboard players get $damage_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.1 run scoreboard players get $damage_bonus gm4_aa_data
