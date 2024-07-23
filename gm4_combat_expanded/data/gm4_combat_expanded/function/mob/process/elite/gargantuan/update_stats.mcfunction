
scoreboard players operation @s gm4_ce_data = $curr_health gm4_ce_data
attribute @s generic.movement_speed modifier remove gm4_combat_expanded:elite_buff.giant.health_reduction_stats
attribute @s generic.attack_damage modifier remove gm4_combat_expanded:elite_buff.giant.health_reduction_stats
attribute @s generic.knockback_resistance modifier remove gm4_combat_expanded:elite_buff.giant.health_reduction_stats

execute store result score $max_health gm4_ce_data run attribute @s generic.max_health get 10
scoreboard players operation $curr_health gm4_ce_data /= $max_health gm4_ce_data
scoreboard players set $curr_health_percent_lost gm4_ce_data 100
scoreboard players operation $curr_health_percent_lost gm4_ce_data -= $curr_health gm4_ce_data

execute if score $curr_health_percent_lost gm4_ce_data matches 50.. run effect give @s[type=!skeleton] resistance infinite 0 true
execute if score $curr_health_percent_lost gm4_ce_data matches 75.. run effect give @s[type=!skeleton] resistance infinite 1 true

execute if score $curr_health_percent_lost gm4_ce_data matches 50.. run scoreboard players set @s[type=skeleton] gm4_ce_arrow_fire_delay 2
execute if score $curr_health_percent_lost gm4_ce_data matches 75.. run scoreboard players set @s[type=skeleton] gm4_ce_arrow_fire_delay 3

execute store result storage gm4_combat_expanded:temp set.speed float 0.015 run scoreboard players get $curr_health_percent_lost gm4_ce_data
execute store result storage gm4_combat_expanded:temp set.damage float 0.005 run scoreboard players get $curr_health_percent_lost gm4_ce_data
execute store result storage gm4_combat_expanded:temp set.knockback_resistance float 0.0015 run scoreboard players add $curr_health_percent_lost gm4_ce_data 567
function gm4_combat_expanded:mob/process/elite/gargantuan/eval_stats with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set
