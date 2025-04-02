# reveal snowy trap when a player gets nearby
# @s = hidden snowy trap
# at @s
# run from main

kill @s 

execute unless block ~ ~ ~ snow run return 0

# spring the trap
particle block{block_state:"snow"} ~ ~1 ~ 0.2 0.6 0.2 1 12
playsound minecraft:block.snow.place block @a ~ ~ ~ 1.5 0.8

execute store result score $pick_entity gm4_mu_data run random value 1..3
scoreboard players set $mob_extras gm4_sr_data 1
execute if score $pick_entity gm4_mu_data matches 1 run summon zombie ~ ~-0.75 ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,0.5d,0.0d]}
execute if score $pick_entity gm4_mu_data matches 2 run summon stray ~ ~-0.75 ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,0.5d,0.0d]}
execute if score $pick_entity gm4_mu_data matches 3 run summon creeper ~ ~-0.75 ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,0.5d,0.0d]}

execute as @n[type=#gm4_survival_refightalized:modify,tag=gm4_sr_extra_mob] at @s run function gm4_survival_refightalized:mob/init/initiate
