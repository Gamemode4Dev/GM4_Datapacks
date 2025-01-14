schedule function gm4_augmented_armor:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_aa_item_checked] run function gm4_augmented_armor:check_item

# training dummy
execute as @e[type=zombie,tag=gm4_aa_training_dummy] run function gm4_augmented_armor:training_dummy/process
