
# check health
execute store result score $curr_health gm4_ce_data run data get entity @s Health 1000
execute unless score $curr_health gm4_ce_data = @s gm4_ce_data run function gm4_combat_expanded:mob/process/elite/giant/update_stats

scoreboard players set $has_target gm4_ce_data 0
execute on target if entity @s[distance=..7] run scoreboard players set $has_target gm4_ce_data 1

# no target
execute unless score @s gm4_ce_timer matches 1.. if score $has_target gm4_ce_data matches 0 run return 0
# otherwise 10% chance to start attack
execute unless score @s gm4_ce_timer matches 1.. if score $has_target gm4_ce_data matches 1 unless predicate gm4_combat_expanded:technical/chance/giant_ground_smash run return 0

scoreboard players add @s gm4_ce_timer 1
scoreboard players set @s[scores={gm4_ce_timer=20..}] gm4_ce_timer 0

scoreboard players set $particle_ring gm4_ce_data 72
execute if score @s gm4_ce_timer matches 2..4 rotated 0 0 run function gm4_combat_expanded:mob/process/elite/giant/particle_ring

attribute @s[scores={gm4_ce_timer=1}] generic.movement_speed modifier add gm4_combat_expanded:elite_buff.giant.charging -1 add_multiplied_total

execute if score @s gm4_ce_timer matches 2 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.2
execute if score @s gm4_ce_timer matches 3 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.4
execute if score @s gm4_ce_timer matches 4 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.7

data modify entity @s[scores={gm4_ce_timer=4}] Motion set value [0d,0.5d,0d]

execute if score @s gm4_ce_timer matches 5 run function gm4_combat_expanded:mob/process/elite/giant/activate
