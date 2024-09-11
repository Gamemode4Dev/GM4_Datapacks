# Calculate deposited xp
# @s = players on top of ender chest
# at @s
# run from dump_level and xp_deposit_loop

# deposit 64 points if possible
execute if score @s gm4_xp_calc matches 64.. run experience add @s -64 points
execute if score @s gm4_xp_calc matches 64.. run scoreboard players add @s gm4_stored_xp 64
execute if score @s gm4_xp_calc matches 64.. run scoreboard players remove @s gm4_xp_calc 64

# deposit 32 points if possible
execute if score @s gm4_xp_calc matches 32.. run experience add @s -32 points
execute if score @s gm4_xp_calc matches 32.. run scoreboard players add @s gm4_stored_xp 32
execute if score @s gm4_xp_calc matches 32.. run scoreboard players remove @s gm4_xp_calc 32

# deposit 16 points if possible
execute if score @s gm4_xp_calc matches 16.. run experience add @s -16 points
execute if score @s gm4_xp_calc matches 16.. run scoreboard players add @s gm4_stored_xp 16
execute if score @s gm4_xp_calc matches 16.. run scoreboard players remove @s gm4_xp_calc 16

# deposit 8 points if possible
execute if score @s gm4_xp_calc matches 8.. run experience add @s -8 points
execute if score @s gm4_xp_calc matches 8.. run scoreboard players add @s gm4_stored_xp 8
execute if score @s gm4_xp_calc matches 8.. run scoreboard players remove @s gm4_xp_calc 8

# deposit 4 points if possible
execute if score @s gm4_xp_calc matches 4.. run experience add @s -4 points
execute if score @s gm4_xp_calc matches 4.. run scoreboard players add @s gm4_stored_xp 4
execute if score @s gm4_xp_calc matches 4.. run scoreboard players remove @s gm4_xp_calc 4

# deposit 2 points if possible
execute if score @s gm4_xp_calc matches 2.. run experience add @s -2 points
execute if score @s gm4_xp_calc matches 2.. run scoreboard players add @s gm4_stored_xp 2
execute if score @s gm4_xp_calc matches 2.. run scoreboard players remove @s gm4_xp_calc 2

# deposit 1 points if possible
execute if score @s gm4_xp_calc matches 1.. run experience add @s -1 points
execute if score @s gm4_xp_calc matches 1.. run scoreboard players add @s gm4_stored_xp 1
execute if score @s gm4_xp_calc matches 1.. run scoreboard players remove @s gm4_xp_calc 1

# repeat loop
execute unless score @s gm4_xp_calc matches 0 unless score loop_counter gm4_xp_calc matches 100.. run function gm4_xp_storage:xp_deposit_loop
scoreboard players add loop_counter gm4_xp_calc 1
