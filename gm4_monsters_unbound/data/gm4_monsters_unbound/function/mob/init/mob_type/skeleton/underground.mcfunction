# apply an underground buff
# @s = skeleton
# at @s
# run from mob/init/mob_type/skeleton/base

execute store result score $buff_picked gm4_mu_data run random value 1..4

execute if score $buff_picked gm4_mu_data matches 1 run effect give @s regeneration infinite 0
execute if score $buff_picked gm4_mu_data matches 2 run scoreboard players add @s gm4_sr_proj_damage_change 4
execute if score $buff_picked gm4_mu_data matches 3 run scoreboard players remove @s gm4_sr_proj_fire_delay 1
execute if score $buff_picked gm4_mu_data matches 4 run item replace entity @s weapon.mainhand with air