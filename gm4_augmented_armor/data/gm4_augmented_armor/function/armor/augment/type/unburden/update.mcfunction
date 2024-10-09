# update unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_augment/type/unburden/check

# mark for change
scoreboard players set $change gm4_aa_data 1

# update the stored armor to not have to do this update until armor value changes
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.stored_armor int 1 run scoreboard players get @s gm4_aa_stat.armor

# calculate level of bonus movement speed and attack speed
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 2
execute if score $level gm4_aa_data matches 1 run scoreboard players set $level gm4_aa_data 150
execute if score $level gm4_aa_data matches 2 run scoreboard players set $level gm4_aa_data 175
execute if score $level gm4_aa_data matches 3 run scoreboard players set $level gm4_aa_data 200
execute if score $level gm4_aa_data matches 4 run scoreboard players set $level gm4_aa_data 225
scoreboard players set $missing_armor gm4_aa_data 20
scoreboard players operation $missing_armor gm4_aa_data -= @s gm4_aa_stat.armor
scoreboard players operation $level gm4_aa_data *= $missing_armor gm4_aa_data
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic_2"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic_2"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic_2"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic_2"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
