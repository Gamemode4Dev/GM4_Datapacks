# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]

# reduce damage, but not below 1
scoreboard players operation $damage_total gm4_sr_data -= $level gm4_aa_data
scoreboard players operation $damage_total gm4_sr_data > #1 gm4_aa_data
