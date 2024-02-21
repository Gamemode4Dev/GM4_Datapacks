
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/pick_target

execute as @a[tag=gm4_ce_boss.watcher.target] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.watcher.current_target

execute if score @s gm4_ce_boss.attack_progress matches 1 facing entity @p[tag=gm4_ce_boss.watcher.current_target] eyes run tp @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] ~ ~ ~ ~ ~

execute if score @s[scores={gm4_ce_boss.phase=1..2}] gm4_ce_boss.attack_progress matches 1 run scoreboard players set @s gm4_ce_boss.tick_delay 30
execute if score @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.attack_progress matches 1 run scoreboard players set @s gm4_ce_boss.tick_delay 20
execute if score @s gm4_ce_boss.attack_progress matches 2..3 run scoreboard players set @s gm4_ce_boss.tick_delay 8
execute if score @s gm4_ce_boss.attack_progress matches 4.. run scoreboard players set @s gm4_ce_boss.tick_delay 10

execute if score @s gm4_ce_boss.attack_progress matches 1 run scoreboard players set $raycast gm4_ce_boss 64
execute if score @s gm4_ce_boss.attack_progress matches 1 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/raycast
execute if score @s gm4_ce_boss.attack_progress matches 1 as @p[tag=gm4_ce_boss.watcher.current_target] at @s run playsound minecraft:block.amethyst_block.break hostile @s ~ ~ ~ 2 0.5

execute if score @s gm4_ce_boss.attack_progress matches 2..4 run playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1 1.3 1
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 summon firework_rocket run function gm4_combat_expanded:boss/watchers/running/attack/fireball/spawn_small_fireball
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 summon firework_rocket run function gm4_combat_expanded:boss/watchers/running/attack/fireball/spawn_small_fireball
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 summon firework_rocket run function gm4_combat_expanded:boss/watchers/running/attack/fireball/spawn_small_fireball
execute if score @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.attack_progress matches 4 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/end

# phase 2+ launch a fireball, bigger in phase 3
execute if score @s[scores={gm4_ce_boss.phase=2}] gm4_ce_boss.attack_progress matches 5 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 summon fireball run function gm4_combat_expanded:boss/watchers/running/attack/fireball/spawn_fireball
execute if score @s[scores={gm4_ce_boss.phase=3..}] gm4_ce_boss.attack_progress matches 5 at @e[type=block_display,tag=gm4_ce_boss.watcher.crystal,tag=gm4_ce_boss.watcher.running] positioned ^ ^ ^1.5 summon fireball run function gm4_combat_expanded:boss/watchers/running/attack/fireball/spawn_big_fireball
execute if score @s gm4_ce_boss.attack_progress matches 5 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/end

tag @a remove gm4_ce_boss.watcher.current_target
