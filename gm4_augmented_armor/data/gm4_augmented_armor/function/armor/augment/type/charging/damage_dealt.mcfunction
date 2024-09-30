# grant ramping move speed and hunger to sprinting player
# @s = player wearing husk armour above 50% health and sprinting
# at unspecified
# run from armor/augment/damage_dealt

scoreboard players set $change gm4_aa_data 1

# if player was above 4 attack speed add full charge unless it was already here
execute if score $attribute.attack_speed gm4_aa_data matches 41.. unless score $active gm4_aa_data matches 1 run return run function gm4_augmented_armor:armor/augment/type/charging/full_charge

# remove charge if this piece was charged and charge was used
execute if score $active gm4_aa_data matches 1 run return run function gm4_augmented_armor:armor/augment/type/charging/remove_charge

# otherwise increase the level
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10

execute if score $slot gm4_aa_data matches 0 store result score $curr_bonus gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount 1000
execute if score $slot gm4_aa_data matches 1 store result score $curr_bonus gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount 1000
execute if score $slot gm4_aa_data matches 2 store result score $curr_bonus gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount 1000
execute if score $slot gm4_aa_data matches 3 store result score $curr_bonus gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount 1000

scoreboard players operation $curr_bonus gm4_aa_data += $level gm4_aa_data

execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.001 run scoreboard players get $curr_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.001 run scoreboard players get $curr_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.001 run scoreboard players get $curr_bonus gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.001 run scoreboard players get $curr_bonus gm4_aa_data
