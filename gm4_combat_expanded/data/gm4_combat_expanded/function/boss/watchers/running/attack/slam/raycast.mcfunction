
scoreboard players remove $raycast gm4_ce_boss 1
particle witch ~ ~ ~ 0.05 0.5 0.05 0.03 16
particle dragon_breath ~ ~ ~ 0.25 0.5 0.25 0.125 16

execute if score $raycast gm4_ce_boss matches 1.. unless block ~ ~-1 ~ #gm4:no_collision run function gm4_combat_expanded:boss/watchers/running/attack/slam/explode
execute if score $raycast gm4_ce_boss matches 0 run function gm4_combat_expanded:boss/watchers/running/attack/slam/explode

execute if score $raycast gm4_ce_boss matches 1.. positioned ~ ~-1 ~ run function gm4_combat_expanded:boss/watchers/running/attack/slam/raycast
