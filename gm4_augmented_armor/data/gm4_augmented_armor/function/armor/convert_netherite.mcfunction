# update the armor and name when it is upgraded to netherite
# @s = player having the armor equipped
# at @s
# run from any armor/slot/<SLOT>

# set armor to be converted
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.netherite set value 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.material set value 6

# add stats from netherite
execute store result score $armor gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"minecraft:generic.armor_toughness"}].amount 10
execute store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"minecraft:generic.armor_toughness"}].amount double 0.1 run scoreboard players add $armor gm4_aa_data 10
data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"minecraft:generic.knockback_resistance"}].amount set value 0.1d

# set durability from netherite
execute store result score $slot gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.slot
execute if score $slot gm4_aa_data matches 3 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 481
execute if score $slot gm4_aa_data matches 2 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 555
execute if score $slot gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 592
execute if score $slot gm4_aa_data matches 0 run data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.durability set value 407

# update item
scoreboard players set $change gm4_aa_data 1