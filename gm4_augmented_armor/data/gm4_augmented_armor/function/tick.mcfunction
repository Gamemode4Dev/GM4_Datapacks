schedule function gm4_augmented_armor:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_aa_item_checked] run function gm4_augmented_armor:check_item

# | Reset Scoreboards
# TODO: remove
scoreboard players reset @a gm4_aa_absorped
scoreboard players reset @a gm4_aa_shielded_hit