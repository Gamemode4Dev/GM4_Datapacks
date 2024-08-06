
execute if entity @s[tag=gm4_mu_weak_arrow] run scoreboard players set $damage_reduction gm4_mu_data 1
execute if score @s gm4_mu_arrow_fire_delay matches 1.. run function gm4_monsters_unbound:mob/process/arrow/add_skeleton_delay
