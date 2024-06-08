# give mount speed and secondary effects
# @s = vehicle of player with armor
# at @s
# run from armor/check_modifier/equip

# apply secondary effects
execute store result score $level2 gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2
execute if score $level2 gm4_ce_data matches 1 run effect give @s resistance 3 1 true
execute if score $level2 gm4_ce_data matches 2 run effect give @s jump_boost 3 1 true
execute if score $level2 gm4_ce_data matches 3 run effect give @s fire_resistance 3 0 true
execute if score $level2 gm4_ce_data matches 4 run effect give @s regeneration 3 0 true

# add levels among pieces and store to mount
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation @s gm4_ce_horse.speed_level += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation @s gm4_ce_horse.speed_level += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation @s gm4_ce_horse.speed_level += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation @s gm4_ce_horse.speed_level += $level_add gm4_ce_data
