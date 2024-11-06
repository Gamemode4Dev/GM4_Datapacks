# update the armor and name when it is upgraded to netherite
# @s = player having the armor equipped
# at @s
# run from any armor/slot/<SLOT>

# set armor to be converted
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.netherite set value 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.material set value 6

# add 1 to armor toughness
execute if score $slot gm4_aa_data matches 0 store result score $armor_toughness gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.helmet"}].amount 100
execute if score $slot gm4_aa_data matches 1 store result score $armor_toughness gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.chestplate"}].amount 100
execute if score $slot gm4_aa_data matches 2 store result score $armor_toughness gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.leggings"}].amount 100
execute if score $slot gm4_aa_data matches 3 store result score $armor_toughness gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.boots"}].amount 100

execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.helmet"}].amount double 0.01 run scoreboard players add $armor_toughness gm4_aa_data 100
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.chestplate"}].amount double 0.01 run scoreboard players add $armor_toughness gm4_aa_data 100
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.leggings"}].amount double 0.01 run scoreboard players add $armor_toughness gm4_aa_data 100
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:armor_toughness",id:"minecraft:armor.boots"}].amount double 0.01 run scoreboard players add $armor_toughness gm4_aa_data 100

# add 0.1 to knockback resistance
execute if score $slot gm4_aa_data matches 0 store result score $knockback_resistance gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.helmet"}].amount 100
execute if score $slot gm4_aa_data matches 1 store result score $knockback_resistance gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.chestplate"}].amount 100
execute if score $slot gm4_aa_data matches 2 store result score $knockback_resistance gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.leggings"}].amount 100
execute if score $slot gm4_aa_data matches 3 store result score $knockback_resistance gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.boots"}].amount 100

execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.helmet"}].amount double 0.01 run scoreboard players add $knockback_resistance gm4_aa_data 10
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.chestplate"}].amount double 0.01 run scoreboard players add $knockback_resistance gm4_aa_data 10
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.leggings"}].amount double 0.01 run scoreboard players add $knockback_resistance gm4_aa_data 10
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{type:"minecraft:knockback_resistance",id:"minecraft:armor.boots"}].amount double 0.01 run scoreboard players add $knockback_resistance gm4_aa_data 10

# set durability from netherite
execute if score $slot gm4_aa_data matches 3 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 481
execute if score $slot gm4_aa_data matches 2 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 555
execute if score $slot gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 592
execute if score $slot gm4_aa_data matches 0 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 407

# update item
scoreboard players set $change gm4_aa_data 1
