# activate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/modifier/type/acrobatic/check

# get immunities
# get levels
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.level

# get effects to become immune to
execute if score $level gm4_aa_data matches 1 run tag @s add gm4_aa_immune_levitation
execute if score $level gm4_aa_data matches 2 run tag @s add gm4_aa_immune_slow_falling
execute if score $level gm4_aa_data matches 3 run tag @s add gm4_aa_immune_slowness

# remove effects if they were present
execute if score $level gm4_aa_data matches 1 run effect clear @s levitation
execute if score $level gm4_aa_data matches 2 run effect clear @s slow_falling
execute if score $level gm4_aa_data matches 3 run effect clear @s slowness

# tag for effect removal
tag @s add gm4_aa_immune_active
