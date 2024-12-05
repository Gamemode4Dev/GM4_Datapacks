# grant ramping move speed and hunger to sprinting player
# @s = player wearing husk armour above 50% health and sprinting
# at unspecified
# run from armor/augment/damage_dealt

# check the UUID of target entity
data modify storage gm4_augmented_armor:temp giantsbane.target_UUID set from entity @n[type=!#gm4_augmented_armor:augment_immune,distance=..12,tag=!gm4_aa_augment_damager,tag=!smithed.strict,nbt={HurtTime:10s}] UUID
data modify storage gm4_augmented_armor:temp giantsbane.armor_UUID set from storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.last_target
execute store result score $new_target gm4_aa_data run data modify storage gm4_augmented_armor:temp giantsbane.armor_UUID set from storage gm4_augmented_armor:temp giantsbane.target_UUID
execute if score $new_target gm4_aa_data matches 0 run return 0

# set new UUID
scoreboard players set $change gm4_aa_data 1
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.last_target set from storage gm4_augmented_armor:temp giantsbane.target_UUID

# store level in $augment.giantsbane_damage to use later
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $augment.giantsbane_damage gm4_aa_data += $level gm4_aa_data

# cleanup
data remove storage gm4_augmented_armor:temp giantsbane
