# Performs directional mining based on the player's look direction and enchantment level
# @s = player with blasting mace
# at marker (center of broken block)
# run from gm4_blasting_maces:player/blast

# initialize block count (not counting the original block)
scoreboard players set $blast_count gm4_blast_data 0

# pitch determines up/down/horizontal:
# < -45 = looking up (mine ceiling)
# > 45 = looking down (mine floor)
# -45 to 45 = horizontal (mine wall based on yaw)

# level 1 (3x3x1)
# looking up/down - mine 3x3 horizontal plane (X-Z)
execute if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches ..-45 run function gm4_blasting_maces:mining/horizontal_plane_3x3
execute if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches 45.. run function gm4_blasting_maces:mining/horizontal_plane_3x3
# horizontal - mine 3x3 vertical plane based on facing direction
execute if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches -44..44 run function gm4_blasting_maces:mining/vertical_wall_3x3

# level 2 (5x5x1)
# looking up/down - mine 5x5 horizontal plane (X-Z)
execute if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches ..-45 run function gm4_blasting_maces:mining/horizontal_plane_5x5
execute if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches 45.. run function gm4_blasting_maces:mining/horizontal_plane_5x5
# horizontal - mine 5x5 vertical plane based on facing direction
execute if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches -44..44 run function gm4_blasting_maces:mining/vertical_wall_5x5

# explosion effects if blocks were broken
# level 1 (3x3x1)
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches ..-45 run particle explosion ~ ~0.5 ~ 1.5 0.25 1.5 0.1 6
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches ..-45 run particle campfire_cosy_smoke ~ ~0.5 ~ 1.0 0.1 1.0 0.01 4
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches 45.. run particle explosion ~ ~0.5 ~ 1.5 0.25 1.5 0.1 6
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches 45.. run particle campfire_cosy_smoke ~ ~0.5 ~ 1.0 0.1 1.0 0.01 4
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches -44..44 run particle explosion ~ ~1 ~ 1.5 1.5 0.25 0.1 6
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 if score @s gm4_blast_pitch matches -44..44 run particle campfire_cosy_smoke ~ ~1 ~ 1.0 1.0 0.1 0.01 4

# level 2 (5x5x1)
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches ..-45 run particle explosion ~ ~0.5 ~ 2.5 0.25 2.5 0.1 12
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches ..-45 run particle large_smoke ~ ~0.5 ~ 2.0 0.1 2.0 0.05 10
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches ..-45 run particle campfire_cosy_smoke ~ ~0.5 ~ 1.5 0.1 1.5 0.01 6
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches 45.. run particle explosion ~ ~0.5 ~ 2.5 0.25 2.5 0.1 12
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches 45.. run particle large_smoke ~ ~0.5 ~ 2.0 0.1 2.0 0.05 10
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches 45.. run particle campfire_cosy_smoke ~ ~0.5 ~ 1.5 0.1 1.5 0.01 6
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches -44..44 run particle explosion ~ ~1 ~ 2.5 2.5 0.25 0.1 12
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches -44..44 run particle large_smoke ~ ~1 ~ 2.0 2.0 0.1 0.05 10
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 if score @s gm4_blast_pitch matches -44..44 run particle campfire_cosy_smoke ~ ~1 ~ 1.5 1.5 0.1 0.01 6

# layered sounds
# level 1 (3x3x1)
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 0.5 1.2
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_1 run playsound minecraft:block.stone.break block @a ~ ~ ~ 0.8 0.8

# level 2 (5x5x1)
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 0.7 1.0
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 run playsound minecraft:block.stone.break block @a ~ ~ ~ 1.0 0.7
execute if score $blast_count gm4_blast_data matches 1.. if predicate gm4_blasting_maces:blasting_level_2 run playsound minecraft:entity.player.attack.crit block @a ~ ~ ~ 0.4 0.6
