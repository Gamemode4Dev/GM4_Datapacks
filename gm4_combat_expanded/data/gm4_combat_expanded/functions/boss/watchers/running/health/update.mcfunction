
scoreboard players set $health_change gm4_ce_boss 960
scoreboard players operation $health_change gm4_ce_boss -= $health gm4_ce_boss

# cap damage at one time to 35
execute if score $health_change gm4_ce_boss matches 36.. run scoreboard players set $health_change gm4_ce_boss 35

execute if entity @s[tag=gm4_ce_boss.immune] if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:item.shield.block hostile @a[distance=..64] ~ ~ ~ 0.75 0.8 1
execute if entity @s[tag=gm4_ce_boss.immune] if score $health_change gm4_ce_boss matches 1.. run scoreboard players set $health_change gm4_ce_boss 0

scoreboard players operation @s gm4_ce_boss.health -= $health_change gm4_ce_boss
data modify entity @s Health set value 960f

execute if score $health_change gm4_ce_boss matches 1.. run playsound minecraft:entity.allay.hurt hostile @a ~ ~ ~ 0.5 0
execute if score $health_change gm4_ce_boss matches 1.. if score @s gm4_ce_boss.health matches 1.. summon item_display run function gm4_combat_expanded:boss/watchers/running/health/init_display

# also process damage done to the twin
scoreboard players operation @s gm4_ce_boss.health -= $twin_health_change gm4_ce_boss

## PHASES
# Trigger: Once Watcher HP drops below 75/50/25% advance in phase
# Phase 2 - Unlock Aura attack
execute if score @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.health matches ..450 run scoreboard players set @s gm4_ce_boss.phase 2
# Phase 3 - Unlock Explode Minions attack
execute if score @s[scores={gm4_ce_boss.phase=2}] gm4_ce_boss.health matches ..300 run scoreboard players set @s gm4_ce_boss.phase 3
# Phase 4 - 
execute if score @s[scores={gm4_ce_boss.phase=3}] gm4_ce_boss.health matches ..150 run scoreboard players set @s gm4_ce_boss.phase 4

execute if score @s gm4_ce_boss.health matches ..0 run function gm4_combat_expanded:boss/watchers/defeated/kill
