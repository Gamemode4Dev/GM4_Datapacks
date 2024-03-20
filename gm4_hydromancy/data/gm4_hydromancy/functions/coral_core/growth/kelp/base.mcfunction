# grow this kelp
# @s = growth marker
# at @s
# run from coral_core/growth/raycast

scoreboard players add $raycast_limit gm4_hy_data 1
execute store success score $kelp_growth gm4_hy_data run fill ~ ~1 ~ ~ ~1 ~ kelp[age=0] replace #gm4_hydromancy:kelp_replaceable
execute if score $kelp_growth gm4_hy_data matches 1 run function gm4_hydromancy:coral_core/growth/kelp/vfx
execute if score $kelp_growth gm4_hy_data matches 0 run function gm4_hydromancy:coral_core/growth/kelp/raycast

scoreboard players set $raycast_limit gm4_hy_data 0
