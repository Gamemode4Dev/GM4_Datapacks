# process a player that had their armor regeneration timer reset
# @s = player
# at @s
# run from player/armor_regeneration/on_apply
# run from player/damage_taken

# wearing reactive
execute if predicate gm4_augmented_armor:modified_armor/augment/reactive run function gm4_augmented_armor:armor/augment/type/reactive/armor_recharge
execute if predicate gm4_augmented_armor:modified_armor/augment/frostburst run function gm4_augmented_armor:armor/augment/type/frostburst/armor_recharge
