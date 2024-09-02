# process gargantuan elite
# @s = gargantuan elite
# at @s
# run from mob/process/elite/check_type

# check health
execute store result score $curr_health gm4_mu_data run data get entity @s Health 1000
execute unless score $curr_health gm4_mu_data = @s gm4_mu_data run function gm4_monsters_unbound:mob/process/elite/gargantuan/update_stats

# no nearby players
execute unless score @s gm4_mu_timer matches 1.. unless entity @a[gamemode=!spectator,distance=..7] run return 0
# otherwise 40% chance to start attack (60% to return and not use it)
execute unless score @s gm4_mu_timer matches 1.. if entity @a[gamemode=!spectator,distance=..7] if predicate {condition:"minecraft:random_chance",chance:0.6} run return 0

scoreboard players add @s gm4_mu_timer 1
scoreboard players set @s[scores={gm4_mu_timer=20..}] gm4_mu_timer 0

scoreboard players set $particle_ring gm4_mu_data 72
execute if score @s gm4_mu_timer matches 2..4 rotated 0 0 run function gm4_monsters_unbound:mob/process/elite/gargantuan/particle_ring

attribute @s[scores={gm4_mu_timer=1}] generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.giant.charging -1 add_multiplied_total
attribute @s[scores={gm4_mu_timer=1}] generic.follow_range modifier add gm4_monsters_unbound:elite_buff.giant.charging -1 add_multiplied_total

execute if score @s gm4_mu_timer matches 2 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.2
execute if score @s gm4_mu_timer matches 3 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.4
execute if score @s gm4_mu_timer matches 4 run playsound minecraft:entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 1 1.7

data modify entity @s[scores={gm4_mu_timer=4}] Motion set value [0d,0.5d,0d]

execute if score @s gm4_mu_timer matches 5 run function gm4_monsters_unbound:mob/process/elite/gargantuan/activate
