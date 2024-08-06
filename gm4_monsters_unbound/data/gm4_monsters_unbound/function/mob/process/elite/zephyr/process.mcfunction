
scoreboard players set $has_target gm4_mu_data 0
execute on target run scoreboard players set $has_target gm4_mu_data 1

# no target
execute if score $has_target gm4_mu_data matches 0 if score @s gm4_mu_timer matches -2147483648..2147483647 run function gm4_monsters_unbound:mob/process/elite/zephyr/lose_charge
execute if score $has_target gm4_mu_data matches 0 run return run scoreboard players reset @s gm4_mu_timer

scoreboard players add @s gm4_mu_timer 1

execute if score @s gm4_mu_timer matches 1..4 anchored eyes positioned ^ ^-0.15 ^ run particle small_gust ~ ~ ~ 0.35 0.35 0.35 1 6 normal

tag @s[scores={gm4_mu_timer=1}] add gm4_mu_elite.on_hit
attribute @s[scores={gm4_mu_timer=1}] generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.speed.charging -1 add_multiplied_total

execute if score @s gm4_mu_timer matches 2 run playsound minecraft:entity.breeze.inhale hostile @a ~ ~ ~ 1 0.5
execute if score @s gm4_mu_timer matches 3 run playsound minecraft:entity.breeze.charge hostile @a ~ ~ ~ 1 0.5
execute if score @s gm4_mu_timer matches 4 run playsound minecraft:entity.breeze.idle_air hostile @a ~ ~ ~ 1 0.65

execute if score @s gm4_mu_timer matches 5 run function gm4_monsters_unbound:mob/process/elite/zephyr/activate
execute if score @s[type=#gm4_survival_refightalized:skeleton_types] gm4_mu_timer matches 6..10 run function gm4_monsters_unbound:mob/process/elite/zephyr/skeleton/arrow_burst

scoreboard players reset @s[scores={gm4_mu_timer=14..},tag=!gm4_mu_charging_attack] gm4_mu_timer
