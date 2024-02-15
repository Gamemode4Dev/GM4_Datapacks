
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run function gm4_combat_expanded:boss/running/attack/warp/prep
execute if score @s gm4_ce_boss.attack_progress matches 2 run function gm4_combat_expanded:boss/running/attack/warp/away
execute if score @s gm4_ce_boss.attack_progress matches 3 run function gm4_combat_expanded:boss/running/attack/warp/pick_location
execute if score @s gm4_ce_boss.attack_progress matches 4 run function gm4_combat_expanded:boss/running/attack/warp/end

scoreboard players set @s[scores={gm4_ce_boss.attack_progress=1,gm4_ce_boss.phase=1}] gm4_ce_boss.tick_delay 18
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=1,gm4_ce_boss.phase=2..3}] gm4_ce_boss.tick_delay 12
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=1,gm4_ce_boss.phase=4}] gm4_ce_boss.tick_delay 6
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=2..3}] gm4_ce_boss.tick_delay 3
