
execute if entity @s[tag=gm4_ce_weak_arrow] run scoreboard players set $damage_reduction gm4_ce_data 1
execute if score @s gm4_ce_arrow_fire_delay matches 1.. run function gm4_combat_expanded:mob/process/arrow/add_skeleton_delay
