# process pearlescent elite
# @s = pearlescent elite
# at @s
# run from mob/process/elite/check_type

# 33% chance to start attack if mob has a target
scoreboard players set $attack gm4_mu_data 0
execute if score @s gm4_mu_timer matches 1.. run scoreboard players set $attack gm4_mu_data 1
execute unless score $attack gm4_mu_data matches 1 on target if entity @s[type=player] if predicate {condition:"minecraft:random_chance",chance:0.33} run scoreboard players set $attack gm4_mu_data 1
execute if score $attack gm4_mu_data matches 0 run return 0

scoreboard players add @s gm4_mu_timer 1
scoreboard players set @s[scores={gm4_mu_timer=300..}] gm4_mu_timer 0

execute if score @s gm4_mu_timer matches 1 run playsound block.beacon.activate hostile @a ~ ~ ~ 1 0.7
execute if score @s gm4_mu_timer matches 101..110 run playsound block.beacon.deactivate hostile @a ~ ~ ~ 1 0.7

attribute @s[scores={gm4_mu_timer=1}] movement_speed modifier add gm4_monsters_unbound:elite_buff.pearlescent.charging -0.75 add_multiplied_total
attribute @s[scores={gm4_mu_timer=5}] movement_speed modifier remove gm4_monsters_unbound:elite_buff.pearlescent.charging
attribute @s[scores={gm4_mu_timer=5}] movement_speed modifier add gm4_monsters_unbound:elite_buff.pearlescent.firing -0.33 add_multiplied_total
attribute @s[scores={gm4_mu_timer=101..110}] movement_speed modifier remove gm4_monsters_unbound:elite_buff.pearlescent.firing

execute if score @s gm4_mu_timer matches ..100 run particle block{block_state:"pearlescent_froglight"} ~ ~2 ~ 0.3 0.3 0.3 0.5 8

scoreboard players set $attack_hit gm4_mu_data 0
execute if score @s gm4_mu_timer matches 5..100 run function gm4_monsters_unbound:mob/process/elite/pearlescent/lazer
execute if score @s gm4_mu_timer matches 10.. if score $attack_hit gm4_mu_data matches 0 run scoreboard players add @s gm4_mu_timer 10
