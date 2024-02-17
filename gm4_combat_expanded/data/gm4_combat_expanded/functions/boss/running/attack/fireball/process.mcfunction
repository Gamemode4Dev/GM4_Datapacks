
scoreboard players add @s gm4_ce_boss.attack_progress 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run function gm4_combat_expanded:boss/running/attack/fireball/pick_target

execute as @a[tag=gm4_ce_boss.target] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.current_target

execute if score @s gm4_ce_boss.attack_progress matches 1..4 facing entity @p[tag=gm4_ce_boss.current_target] eyes run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ ~ ~

execute if score @s gm4_ce_boss.attack_progress matches 1..4 run playsound block.amethyst_block.break hostile @a[distance=..32] ~ ~ ~ 1 1.3 1

execute if score @s gm4_ce_boss.attack_progress matches 1 run scoreboard players set @s gm4_ce_boss.tick_delay 10
execute if score @s gm4_ce_boss.attack_progress matches 2..3 run scoreboard players set @s gm4_ce_boss.tick_delay 5
execute if score @s gm4_ce_boss.attack_progress matches 4.. run scoreboard players set @s gm4_ce_boss.tick_delay 10

execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 summon small_fireball run function gm4_combat_expanded:boss/running/attack/fireball/spawn_small_fireball
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 summon small_fireball run function gm4_combat_expanded:boss/running/attack/fireball/spawn_small_fireball
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 summon small_fireball run function gm4_combat_expanded:boss/running/attack/fireball/spawn_small_fireball
execute if score @s gm4_ce_boss.attack_progress matches 2..4 run scoreboard players set $raycast gm4_ce_boss 64
execute if score @s gm4_ce_boss.attack_progress matches 2..4 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 run function gm4_combat_expanded:boss/running/attack/fireball/raycast
execute if score @s[scores={gm4_ce_boss.phase=1}] gm4_ce_boss.attack_progress matches 4 run function gm4_combat_expanded:boss/running/attack/fireball/end

# phase 2 launch a fireball
execute if score @s gm4_ce_boss.attack_progress matches 5 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 summon fireball run function gm4_combat_expanded:boss/running/attack/fireball/spawn_fireball
execute if score @s[scores={gm4_ce_boss.phase=2}] gm4_ce_boss.attack_progress matches 5 run function gm4_combat_expanded:boss/running/attack/fireball/end

# phase 3+ launch another fireball
execute if score @s gm4_ce_boss.attack_progress matches 6 facing entity @p[tag=gm4_ce_boss.current_target] eyes run tp @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] ~ ~ ~ ~ ~
execute if score @s gm4_ce_boss.attack_progress matches 6 at @e[type=block_display,tag=gm4_ce_boss.crystal,tag=gm4_ce_boss.running] positioned ^ ^ ^1.5 summon fireball run function gm4_combat_expanded:boss/running/attack/fireball/spawn_fireball
execute if score @s gm4_ce_boss.attack_progress matches 6 run function gm4_combat_expanded:boss/running/attack/fireball/end

tag @a remove gm4_ce_boss.current_target
