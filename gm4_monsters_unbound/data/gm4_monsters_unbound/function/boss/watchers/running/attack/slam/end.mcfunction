
scoreboard players set @s gm4_mu_boss.attack_id 0
scoreboard players reset @s gm4_mu_boss.attack_progress
scoreboard players set @s[scores={gm4_mu_boss.phase=1..2}] gm4_mu_boss.tick_delay 40
scoreboard players set @s[scores={gm4_mu_boss.phase=3..}] gm4_mu_boss.tick_delay 25

execute as @e[type=item_display,tag=gm4_mu_boss.watcher.slam_block] if score @s gm4_mu_boss.id = $running_id gm4_mu_boss.id run kill @s

scoreboard players set $raycast gm4_mu_boss 20
execute positioned ~ ~-1 ~ run function gm4_monsters_unbound:boss/watchers/running/attack/slam/raycast
