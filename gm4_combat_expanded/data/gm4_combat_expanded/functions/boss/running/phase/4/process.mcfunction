
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 90
execute if score @s gm4_ce_boss.attack_progress matches 2 run function gm4_combat_expanded:boss/activation/spawn_sentinel/head
execute if score @s gm4_ce_boss.attack_progress matches 3 run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ 0 -90
execute if score @s gm4_ce_boss.attack_progress matches 4 positioned ~ ~2 ~ run function gm4_combat_expanded:boss/activation/spawn_sentinel/head
execute if score @s gm4_ce_boss.attack_progress matches 5 run function gm4_combat_expanded:boss/running/phase/4/end

scoreboard players set @s gm4_ce_boss.tick_delay 5
