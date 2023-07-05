# apply chime damage
# @s = entity hit with the weapon
# at @s
# run from weapon/modifier/chime/check_target

scoreboard players set $chime_target gm4_ce_data 1
execute if score $chime_damage gm4_ce_data matches 2 run damage @s 2 player_attack
execute if score $chime_damage gm4_ce_data matches 4 run damage @s 4 player_attack
execute if score $chime_damage gm4_ce_data matches 8 run damage @s 8 player_attack
execute if score $chime_damage gm4_ce_data matches 16 run damage @s 16 player_attack
execute if score $chime_damage gm4_ce_data matches 32 run damage @s 32 player_attack
execute if score $chime_damage gm4_ce_data matches 64 run damage @s 64 player_attack
execute if score $chime_damage gm4_ce_data matches 128 run damage @s 128 player_attack
execute if score $chime_damage gm4_ce_data matches 256 run damage @s 256 player_attack

execute if score $chime_damage gm4_ce_data matches 2 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 0.5 0
execute if score $chime_damage gm4_ce_data matches 4 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 0.6 0.3
execute if score $chime_damage gm4_ce_data matches 8 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 0.7 0.6
execute if score $chime_damage gm4_ce_data matches 16 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 0.8 0.9
execute if score $chime_damage gm4_ce_data matches 32 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 0.9 1.2
execute if score $chime_damage gm4_ce_data matches 64 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 1 1.5
execute if score $chime_damage gm4_ce_data matches 128 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 1.25 1.8
execute if score $chime_damage gm4_ce_data matches 256 run playsound minecraft:block.note_block.chime player @a ~ ~ ~ 1.5 2

execute at @s run particle minecraft:note ~ ~0.5 ~ 0.4 0.6 0.4 0 8

execute if score $chime_damage gm4_ce_data matches ..128 run scoreboard players operation $chime_damage gm4_ce_data *= #2 gm4_ce_data
