# scheduled from self and start_ticking

execute as @e[type=armor_stand,tag=gm4_smeltery,tag=gm4_bf_could_smelt] at @s if block ^ ^ ^1 furnace{CookTime:199s} run function gm4_smelteries:smelt

scoreboard players remove ticking_counter gm4_bf_data 1
execute if score ticking_counter gm4_bf_data matches 1.. run schedule function gm4_smelteries:limited_tick 1t
