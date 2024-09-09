
# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check what type of aura to add levels to
scoreboard players set $gleaming.burning gm4_aa_data 0
scoreboard players set $gleaming.frost gm4_aa_data 0
scoreboard players set $gleaming.luminous gm4_aa_data 0

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:gleaming}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 run scoreboard players add $gleaming.burning gm4_aa_data 1
execute if score $level gm4_aa_data matches 2 run scoreboard players add $gleaming.frost gm4_aa_data 1
execute if score $level gm4_aa_data matches 3 run scoreboard players add $gleaming.luminous gm4_aa_data 1

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:gleaming}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 run scoreboard players add $gleaming.burning gm4_aa_data 1
execute if score $level gm4_aa_data matches 2 run scoreboard players add $gleaming.frost gm4_aa_data 1
execute if score $level gm4_aa_data matches 3 run scoreboard players add $gleaming.luminous gm4_aa_data 1

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:gleaming}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 run scoreboard players add $gleaming.burning gm4_aa_data 1
execute if score $level gm4_aa_data matches 2 run scoreboard players add $gleaming.frost gm4_aa_data 1
execute if score $level gm4_aa_data matches 3 run scoreboard players add $gleaming.luminous gm4_aa_data 1

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:gleaming}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 run scoreboard players add $gleaming.burning gm4_aa_data 1
execute if score $level gm4_aa_data matches 2 run scoreboard players add $gleaming.frost gm4_aa_data 1
execute if score $level gm4_aa_data matches 3 run scoreboard players add $gleaming.luminous gm4_aa_data 1

scoreboard players operation @s gm4_aa_augment.gleaming.burning += $gleaming.burning gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.frost += $gleaming.frost gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.luminous += $gleaming.luminous gm4_aa_data
scoreboard players set @s gm4_aa_augment.gleaming.timer 200

scoreboard players operation @s gm4_aa_augment.gleaming.burning < #10 gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.frost < #10 gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.luminous < #10 gm4_aa_data

tag @s add gm4_aa_gleaming.active

execute unless score $keep_tick.gleaming gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/gleaming 1t
