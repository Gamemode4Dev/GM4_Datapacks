
# reset peek to 1, sometimes it can get lost
data modify entity @s Peek set value 1b

# tag all entities affiliated with this boss entity
execute as @e[tag=gm4_ce_boss.head] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run tag @s add gm4_ce_boss.running
tag @s add gm4_ce_boss.running

# pick new attack if there was none selected
execute unless score @s gm4_ce_boss.attack_id matches 1.. run function gm4_combat_expanded:boss/running/pick_attack
# process attacks
execute if score @s gm4_ce_boss.attack_id matches 2 run function gm4_combat_expanded:boss/running/attack/fireball/process
execute if score @s gm4_ce_boss.attack_id matches 3 run function gm4_combat_expanded:boss/running/attack/warp/process
execute if score @s gm4_ce_boss.attack_id matches 4 run function gm4_combat_expanded:boss/running/attack/slam/process
execute if score @s gm4_ce_boss.attack_id matches 5 run function gm4_combat_expanded:boss/running/attack/summon_minions/process
execute if score @s gm4_ce_boss.attack_id matches 6 run function gm4_combat_expanded:boss/running/attack/explode_minions/process
execute if score @s gm4_ce_boss.attack_id matches 7 run function gm4_combat_expanded:boss/running/attack/aura/process
# phases
execute if score @s gm4_ce_boss.attack_id matches 1 run function gm4_combat_expanded:boss/running/phase/1/process
execute if score @s gm4_ce_boss.attack_id matches 20 run function gm4_combat_expanded:boss/running/phase/2/process
execute if score @s gm4_ce_boss.attack_id matches 21 run function gm4_combat_expanded:boss/running/phase/3/process
execute if score @s gm4_ce_boss.attack_id matches 22 run function gm4_combat_expanded:boss/running/phase/4/process
# shield
execute if score @s gm4_ce_boss.attack_id matches 30 run function gm4_combat_expanded:boss/running/attack/shield/process

# remove tracking tags
tag @e remove gm4_ce_boss.running
