# process a player that had their combat regeneration timer reset
# @s = player
# at @s
# run from player/combat_regeneration/on_apply
# run from player/damage_taken

# wearing hearty
execute if predicate gm4_augmented_armor:modified_armor/augment/hearty run function gm4_augmented_armor:armor/augment/type/hearty/regen_speed
