
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 0 90

execute if score @s gm4_ce_boss.attack_progress matches 1 positioned ~ ~.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/slam/spawn_block
execute if score @s gm4_ce_boss.attack_progress matches 4 positioned ~ ~.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/slam/spawn_block
execute if score @s gm4_ce_boss.attack_progress matches 7 positioned ~ ~.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/slam/spawn_block
execute if score @s gm4_ce_boss.attack_progress matches 10 positioned ~ ~.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/slam/spawn_block
execute if score @s gm4_ce_boss.attack_progress matches 13 positioned ~ ~.5 ~ summon item_display run function gm4_combat_expanded:boss/watchers/running/attack/slam/spawn_block

# do this first because it changes if the boss warps
scoreboard players set @s[scores={gm4_ce_boss.phase=1..2,gm4_ce_boss.attack_progress=..14}] gm4_ce_boss.tick_delay 3
scoreboard players set @s[scores={gm4_ce_boss.phase=3..,gm4_ce_boss.attack_progress=..14}] gm4_ce_boss.tick_delay 2
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=15}] gm4_ce_boss.tick_delay 3
scoreboard players set @s[scores={gm4_ce_boss.attack_progress=16..}] gm4_ce_boss.tick_delay 6

# in phase 4 33% chance to teleport to over a player
execute if entity @s[scores={gm4_ce_boss.phase=4,gm4_ce_boss.attack_progress=13},predicate=gm4_combat_expanded:technical/chance/boss/slam_teleport] run tag @s add gm4_ce_boss.watcher.slam_teleporting
execute if entity @s[tag=gm4_ce_boss.watcher.slam_teleporting,scores={gm4_ce_boss.attack_progress=13..15}] run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_warp/process

execute if score @s gm4_ce_boss.attack_progress matches ..15 as @e[type=item_display,tag=gm4_ce_boss.watcher.slam_block] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id at @s run tp @s ~ ~ ~ ~24 ~
execute if score @s gm4_ce_boss.attack_progress matches 16 as @e[type=item_display,tag=gm4_ce_boss.watcher.slam_block] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run function gm4_combat_expanded:boss/watchers/running/attack/slam/raise_blocks
execute if score @s gm4_ce_boss.attack_progress matches 17 as @e[type=item_display,tag=gm4_ce_boss.watcher.slam_block] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run function gm4_combat_expanded:boss/watchers/running/attack/slam/slam_down
execute if score @s gm4_ce_boss.attack_progress matches 18 run function gm4_combat_expanded:boss/watchers/running/attack/slam/end
