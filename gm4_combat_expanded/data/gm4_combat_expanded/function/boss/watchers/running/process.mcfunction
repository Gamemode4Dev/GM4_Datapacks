# process watcher boss
# @s = boss shulker
# at @s
# run from boss/watchers/tick_twin
# run from boss/watchers/tick

# reset peek to 1 and Attachface to 1 if it got lost
data merge entity @s[nbt=!{Peek:1b,AttachFace:1b}] {Peek:1b,AttachFace:1b}

# tag all entities affiliated with this boss entity
execute as @e[tag=gm4_ce_boss.watcher.head] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.watcher.running
tag @s add gm4_ce_boss.watcher.running

# pick new attack if there was none selected
execute unless score @s gm4_ce_boss.attack_id matches 1.. run function gm4_combat_expanded:boss/watchers/running/pick_attack
# spawning
execute if score @s gm4_ce_boss.attack_id matches 1 run function gm4_combat_expanded:boss/watchers/running/attack/spawn/process
# process attacks
execute if score @s gm4_ce_boss.attack_id matches 2 run function gm4_combat_expanded:boss/watchers/running/attack/fireball/process
execute if score @s gm4_ce_boss.attack_id matches 3 run function gm4_combat_expanded:boss/watchers/running/attack/warp/process
execute if score @s gm4_ce_boss.attack_id matches 4 run function gm4_combat_expanded:boss/watchers/running/attack/slam/process
execute if score @s gm4_ce_boss.attack_id matches 5 run function gm4_combat_expanded:boss/watchers/running/attack/summon_minions/process
execute if score @s gm4_ce_boss.attack_id matches 6 run function gm4_combat_expanded:boss/watchers/running/attack/explode_minions/process
execute if score @s gm4_ce_boss.attack_id matches 7 run function gm4_combat_expanded:boss/watchers/running/attack/aura/process
# shield
execute if score @s gm4_ce_boss.attack_id matches 8 run function gm4_combat_expanded:boss/watchers/running/attack/shield/process

# remove tracking tags
tag @e remove gm4_ce_boss.watcher.running
