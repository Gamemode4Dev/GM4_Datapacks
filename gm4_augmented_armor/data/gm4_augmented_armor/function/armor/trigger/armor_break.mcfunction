# process a player that had their armor broken
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function player/health/damaged/calculate_damage

# augments
execute if predicate gm4_augmented_armor:modified_armor/augment/reactive run function gm4_augmented_armor:armor/augment/type/reactive/add_levels
execute if predicate gm4_augmented_armor:modified_armor/augment/frostburst run function gm4_augmented_armor:armor/augment/type/frostburst/add_levels
