# process watcher boss spawning
# @s = boss shulker
# at @s
# run from boss/watchers/process

scoreboard players add @s gm4_ce_boss.attack_progress 1
scoreboard players set @s gm4_ce_boss.tick_delay 2

# slowly fill health bar
execute if score @s gm4_ce_boss.attack_progress matches 1 run scoreboard players set @s gm4_ce_boss.health 2
scoreboard players add @s[tag=gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.attack_progress=14..43}] gm4_ce_boss.health 20
scoreboard players add @s[tag=!gm4_ce_boss.watcher.has_twin,scores={gm4_ce_boss.attack_progress=14..43}] gm4_ce_boss.health 10
data modify entity @s Health set value 960f

execute if score @s gm4_ce_boss.attack_progress matches 15 as @e[type=block_display,tag=gm4_ce_boss.watcher.running,tag=gm4_ce_boss.watcher.crystal] run data modify entity @s block_state.Name set value "medium_amethyst_bud"
execute if score @s gm4_ce_boss.attack_progress matches 31 as @e[type=block_display,tag=gm4_ce_boss.watcher.running,tag=gm4_ce_boss.watcher.crystal] run data modify entity @s block_state.Name set value "large_amethyst_bud"
execute if score @s gm4_ce_boss.attack_progress matches 41 as @e[type=block_display,tag=gm4_ce_boss.watcher.running,tag=gm4_ce_boss.watcher.crystal] run data modify entity @s block_state.Name set value "amethyst_cluster"

execute if score @s gm4_ce_boss.attack_progress matches 15 run playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1 0.9 1
execute if score @s gm4_ce_boss.attack_progress matches 31 run playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1 0.7 1
execute if score @s gm4_ce_boss.attack_progress matches 41 run playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1 0.5 1

execute if score @s gm4_ce_boss.attack_progress matches 15..30 run particle minecraft:reverse_portal ~ ~.5 ~ 0.4 0.4 0.4 0.2 6
execute if score @s gm4_ce_boss.attack_progress matches 31..40 run particle minecraft:reverse_portal ~ ~.5 ~ 0.4 0.4 0.4 0.55 10
execute if score @s gm4_ce_boss.attack_progress matches 41..45 run particle minecraft:reverse_portal ~ ~.5 ~ 0.4 0.4 0.4 1 18

execute if score @s[tag=gm4_ce_boss.watcher.has_twin] gm4_ce_boss.attack_progress matches 43 run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ 0 90
execute if score @s[tag=gm4_ce_boss.watcher.has_twin] gm4_ce_boss.attack_progress matches 45 run function gm4_combat_expanded:boss/watchers/activation/spawn_sentinel/head

execute if score @s gm4_ce_boss.attack_progress matches 46 run function gm4_combat_expanded:boss/watchers/running/attack/spawn/end
