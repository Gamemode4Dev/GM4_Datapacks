# deal AoE damage
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

tellraw @p {"score":{"name":"@s","objective":"gm4_ce_giant_damage"}}
tellraw @p {"score":{"name":"@s","objective":"gm4_ce_giant_damage_stored"}}

scoreboard players operation @s gm4_ce_giant_damage_stored /= #10 gm4_ce_data

tellraw @p {"score":{"name":"@s","objective":"gm4_ce_giant_damage_stored"}}

execute if score @s gm4_ce_giant_damage_stored matches 1 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 1 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 2 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 2 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 3 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 3 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 4 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 4 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 5 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 5 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 6 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 6 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 7 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 7 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 8 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 8 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 9 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 9 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 10 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 10 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 11 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 11 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 12 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 12 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 13 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 13 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 14 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 14 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 15 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 15 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 16 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 16 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 17 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 17 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 18 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 18 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 19 as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 19 player_attack
execute if score @s gm4_ce_giant_damage_stored matches 20.. as @e[distance=..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 20 player_attack

particle block stone ~ ~ ~ 1 0.2 1 1 30
playsound minecraft:entity.zombie.attack_wooden_door player @a ~ ~ ~ 0.7 0.25
