# process a player that shot an arrow
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function mob/process/arrow/run

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# apply custom attributes
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{custom_attribute:{arrow_damage:{}}}}] run function gm4_augmented_armor:armor/custom_attribute/arrow_damage
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{custom_attribute:{arrow_speed:{}}}}] run function gm4_augmented_armor:armor/custom_attribute/arrow_speed

# archery
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{augment:{name:archery}}}] run function gm4_augmented_armor:armor/augment/type/archery/find_arrow

# cleanup
data remove storage gm4_augmented_armor:temp Items
