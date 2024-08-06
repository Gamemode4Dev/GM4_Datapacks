
scoreboard players add @s gm4_mu_boss.attack_progress 1

execute if score @s gm4_mu_boss.attack_progress matches 2 run function gm4_monsters_unbound:boss/watchers/running/attack/warp/away
execute if score @s gm4_mu_boss.attack_progress matches 3 run function gm4_monsters_unbound:boss/watchers/running/attack/warp/pick_location
execute if score @s gm4_mu_boss.attack_progress matches 4 run function gm4_monsters_unbound:boss/watchers/running/attack/warp/end

scoreboard players set @s[scores={gm4_mu_boss.attack_progress=1,gm4_mu_boss.phase=1}] gm4_mu_boss.tick_delay 22
scoreboard players set @s[scores={gm4_mu_boss.attack_progress=1,gm4_mu_boss.phase=2..3}] gm4_mu_boss.tick_delay 16
scoreboard players set @s[scores={gm4_mu_boss.attack_progress=1,gm4_mu_boss.phase=4}] gm4_mu_boss.tick_delay 10
scoreboard players set @s[scores={gm4_mu_boss.attack_progress=2..3}] gm4_mu_boss.tick_delay 3
