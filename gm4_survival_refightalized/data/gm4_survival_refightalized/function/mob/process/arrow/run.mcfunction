
scoreboard players operation $arrow_damage gm4_sr_data += @s gm4_sr_arrow_damage_change

execute if score @s[type=!player] gm4_sr_arrow_fire_delay matches 1.. run function gm4_survival_refightalized:mob/process/arrow/add_fire_delay
