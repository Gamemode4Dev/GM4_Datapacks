
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 90

execute if score @s gm4_ce_boss.attack_progress matches 2 run function gm4_combat_expanded:boss/running/attack/spawn_sentinel/spawn/head
execute if score @s gm4_ce_boss.attack_progress matches 3 run function gm4_combat_expanded:boss/running/attack/spawn_sentinel/end

scoreboard players set @s gm4_ce_boss.tick_delay 10
