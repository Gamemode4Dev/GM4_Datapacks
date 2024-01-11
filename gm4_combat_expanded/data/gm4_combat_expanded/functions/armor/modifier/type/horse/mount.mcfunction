# give mount speed and resistance
# @s = vehicle of player with armor
# at @s
# run from armor/check_modifier/equip

execute store result score $level2 gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2
execute if score $level2 gm4_ce_data matches 1 run effect give @s resistance 3 1 true
execute if score $level2 gm4_ce_data matches 2 run effect give @s jump_boost 3 1 true
execute if score $level2 gm4_ce_data matches 3 run effect give @s fire_resistance 3 0 true
execute if score $level2 gm4_ce_data matches 4 run effect give @s regeneration 3 0 true

# if speed was already given skip that part
execute if entity @s[tag=gm4_ce_speed_given] run return 0

# add levels among pieces
scoreboard players set $level gm4_ce_data 0

execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded{modifier_name:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation $level gm4_ce_data += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded{modifier_name:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation $level gm4_ce_data += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded{modifier_name:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation $level gm4_ce_data += $level_add gm4_ce_data

execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded{modifier_name:74} store result score $level_add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded.level
execute if score $level_add gm4_ce_data matches 3 run scoreboard players set $level_add gm4_ce_data 4
scoreboard players operation $level gm4_ce_data += $level_add gm4_ce_data

# give effect
execute if score $level gm4_ce_data matches 1 run effect give @s speed 3 0 true
execute if score $level gm4_ce_data matches 2..3 run effect give @s speed 3 1 true
execute if score $level gm4_ce_data matches 4..7 run effect give @s speed 3 2 true
execute if score $level gm4_ce_data matches 8..15 run effect give @s speed 3 3 true
execute if score $level gm4_ce_data matches 16 run effect give @s speed 3 4 true

tag @s add gm4_ce_speed_given
