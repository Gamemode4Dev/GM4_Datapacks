
particle witch ~ ~ ~ 0.02 0.02 0.02 0.01 1
scoreboard players remove $raycast gm4_ce_boss 1
execute if entity @p[tag=gm4_ce_boss.watcher.current_target,distance=..0.5] run scoreboard players set $raycast gm4_ce_boss 0

execute if score $raycast gm4_ce_boss matches 1.. positioned ^ ^ ^0.25 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/raycast
