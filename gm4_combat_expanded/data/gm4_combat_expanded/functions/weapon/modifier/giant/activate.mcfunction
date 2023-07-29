# deal AoE damage
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

scoreboard players reset $giant_damage gm4_ce_data
execute if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={10_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 10
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={9_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 9
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={8_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 8
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={7_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 7
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={6_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 6
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={5_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 5
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={4_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 4
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={3_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 3
execute unless score $giant_damage gm4_ce_data matches 1.. if entity @s[advancements={gm4_combat_expanded:used_giant_weapon={2_heart=true}}] run scoreboard players set $giant_damage gm4_ce_data 2
execute unless score $giant_damage gm4_ce_data matches 1.. run scoreboard players set $giant_damage gm4_ce_data 1
advancement revoke @s only gm4_combat_expanded:used_giant_weapon

execute if score $giant_damage gm4_ce_data matches 10 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 20 player_attack
execute if score $giant_damage gm4_ce_data matches 9 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 18 player_attack
execute if score $giant_damage gm4_ce_data matches 8 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 16 player_attack
execute if score $giant_damage gm4_ce_data matches 7 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 14 player_attack
execute if score $giant_damage gm4_ce_data matches 6 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 12 player_attack
execute if score $giant_damage gm4_ce_data matches 5 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 10 player_attack
execute if score $giant_damage gm4_ce_data matches 4 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 8 player_attack
execute if score $giant_damage gm4_ce_data matches 3 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 6 player_attack
execute if score $giant_damage gm4_ce_data matches 2 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 4 player_attack
execute if score $giant_damage gm4_ce_data matches 1 as @e[distance=0.01..4,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 2 player_attack

particle block stone ~ ~ ~ 1 0.2 1 1 30
playsound minecraft:entity.zombie.attack_wooden_door player @a ~ ~ ~ 0.7 0.25
