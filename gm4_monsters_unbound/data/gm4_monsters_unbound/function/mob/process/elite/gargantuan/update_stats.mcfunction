# update gargantuan elite stats
# @s = gargantuan elite
# at @s
# run from mob/process/elite/gargantuan/process

scoreboard players operation @s gm4_mu_data = $curr_health gm4_mu_data
attribute @s movement_speed modifier remove gm4_monsters_unbound:elite_buff.giant.health_reduction_stats
attribute @s attack_damage modifier remove gm4_monsters_unbound:elite_buff.giant.health_reduction_stats
attribute @s knockback_resistance modifier remove gm4_monsters_unbound:elite_buff.giant.health_reduction_stats

execute store result score $max_health gm4_mu_data run attribute @s max_health get 10
scoreboard players operation $curr_health gm4_mu_data /= $max_health gm4_mu_data
scoreboard players set $curr_health_percent_lost gm4_mu_data 100
scoreboard players operation $curr_health_percent_lost gm4_mu_data -= $curr_health gm4_mu_data

execute if score $curr_health_percent_lost gm4_mu_data matches 50.. run effect give @s[type=!#gm4_survival_refightalized:skeleton_types] resistance infinite 0 true
execute if score $curr_health_percent_lost gm4_mu_data matches 75.. run effect give @s[type=!#gm4_survival_refightalized:skeleton_types] resistance infinite 1 true

execute if score $curr_health_percent_lost gm4_mu_data matches 50.. run scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow.fire_delay 4
execute if score $curr_health_percent_lost gm4_mu_data matches 75.. run scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow.fire_delay 6

execute store result storage gm4_monsters_unbound:temp set.speed float 0.015 run scoreboard players get $curr_health_percent_lost gm4_mu_data
execute store result storage gm4_monsters_unbound:temp set.damage float 0.005 run scoreboard players get $curr_health_percent_lost gm4_mu_data
execute store result storage gm4_monsters_unbound:temp set.knockback_resistance float 0.0015 run scoreboard players add $curr_health_percent_lost gm4_mu_data 567
function gm4_monsters_unbound:mob/process/elite/gargantuan/eval_stats with storage gm4_monsters_unbound:temp set
data remove storage gm4_monsters_unbound:temp set
