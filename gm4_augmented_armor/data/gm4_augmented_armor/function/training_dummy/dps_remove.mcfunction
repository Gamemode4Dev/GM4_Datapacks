
# remove old damage
execute store result score $reduce_dps gm4_aa_data run data get storage gm4_augmented_armor:temp dps.array[0].damage
scoreboard players operation @s gm4_aa_training_dummy.dps -= $reduce_dps gm4_aa_data
data remove storage gm4_augmented_armor:temp dps.array[0]
