
execute if score @s gm4_ce_boss.attack_progress matches 13 run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_warp/away
execute if score @s gm4_ce_boss.attack_progress matches 14 run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_warp/pick_location
execute if score @s gm4_ce_boss.attack_progress matches 15 run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_warp/end
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=15}] gm4_ce_boss.tick_delay 13
