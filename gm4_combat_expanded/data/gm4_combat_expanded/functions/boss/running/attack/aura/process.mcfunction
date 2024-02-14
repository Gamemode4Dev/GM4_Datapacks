
scoreboard players add @s gm4_ce_boss.attack_progress 1
scoreboard players set @s gm4_ce_boss.tick_delay 2

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 0
execute if score @s gm4_ce_boss.attack_progress matches 1..23 as @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] at @s run tp @s ~ ~ ~ ~30 ~
execute if score @s gm4_ce_boss.attack_progress matches 24.. as @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] at @s run tp @s ~ ~ ~ ~75 ~

execute if score @s gm4_ce_boss.attack_progress matches 25..34 run effect give @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] wither 4 0
execute if score @s gm4_ce_boss.attack_progress matches 35..44 run effect give @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] wither 4 1
execute if score @s gm4_ce_boss.attack_progress matches 45..59 run effect give @a[distance=..5.125,gamemode=!spectator,gamemode=!creative] wither 4 2

execute if score @s gm4_ce_boss.attack_progress matches 60 run function gm4_combat_expanded:boss/running/attack/aura/end
