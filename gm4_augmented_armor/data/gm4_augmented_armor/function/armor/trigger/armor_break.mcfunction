# process a player that had their armor broken
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function player/health/damaged/calculate_damage

# augments
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{augment:{name:reactive}}}] run function gm4_augmented_armor:armor/augment/type/reactive/add_levels
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{augment:{name:bursting}}}] run function gm4_augmented_armor:armor/augment/type/bursting/add_levels
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{augment:{name:berserkers}}}] run function gm4_augmented_armor:armor/augment/type/berserkers/armor_break
