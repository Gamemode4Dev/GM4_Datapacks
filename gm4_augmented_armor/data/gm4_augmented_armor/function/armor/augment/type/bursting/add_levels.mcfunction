# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

# store armor items to storage
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# playsound

# add levels together
scoreboard players set $total_level gm4_aa_data 0

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:bursting}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:bursting}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:bursting}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:bursting}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

# activate on all entities in range
tag @s add gm4_aa_augment_damager
execute store result storage gm4_augmented_armor:temp effect.range float 0.1 run attribute @s minecraft:entity_interaction_range get 10
function gm4_augmented_armor:armor/augment/type/bursting/eval_explosion with storage gm4_augmented_armor:temp effect
data remove storage gm4_augmented_armor:temp effect
tag @s remove gm4_aa_augment_damager

# cleanup
data remove storage gm4_augmented_armor:temp Items
