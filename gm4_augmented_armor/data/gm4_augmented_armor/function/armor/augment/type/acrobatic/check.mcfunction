# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/augment/clocked

# activate inactive armor if player is out of combat
execute unless score @s gm4_aa_in_combat matches 1.. if score $active gm4_aa_data matches 0 run function gm4_augmented_armor:armor/augment/type/acrobatic/activate

# get immunities
# get levels
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]

# get effects to become immune to
execute if score $level gm4_aa_data matches 1 run tag @s add gm4_aa_effect_immunity.levitation
execute if score $level gm4_aa_data matches 2 run tag @s add gm4_aa_effect_immunity.slow_falling
execute if score $level gm4_aa_data matches 3 run tag @s add gm4_aa_effect_immunity.slowness

# remove effects if they were present
execute if score $level gm4_aa_data matches 1 run effect clear @s levitation
execute if score $level gm4_aa_data matches 2 run effect clear @s slow_falling
execute if score $level gm4_aa_data matches 3 run effect clear @s slowness

# tag for effect removal
tag @s add gm4_aa_effect_immunity.active
