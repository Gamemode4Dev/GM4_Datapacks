
scoreboard players set $chime_target gm4_ce_data 1
execute if score $chime_damage gm4_ce_data matches 2 run damage @s 2 player_attack
execute if score $chime_damage gm4_ce_data matches 4 run damage @s 4 player_attack
execute if score $chime_damage gm4_ce_data matches 8 run damage @s 8 player_attack
execute if score $chime_damage gm4_ce_data matches 16 run damage @s 16 player_attack
execute if score $chime_damage gm4_ce_data matches 32 run damage @s 32 player_attack
execute if score $chime_damage gm4_ce_data matches 64 run damage @s 64 player_attack
execute if score $chime_damage gm4_ce_data matches 128 run damage @s 128 player_attack
execute if score $chime_damage gm4_ce_data matches 256 run damage @s 256 player_attack
scoreboard players operation $chime_damage gm4_ce_data *= #2 gm4_ce_data
