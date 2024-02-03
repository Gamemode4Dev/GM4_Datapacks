# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from weapon/modifier/delay/prime
# schedule from here

scoreboard players set $keep_tick.delay gm4_ce_data 0
execute as @e[tag=gm4_cd_delay_active] at @s run function gm4_combat_expanded:weapon/modifier/delay/tick
execute if score $keep_tick.delay gm4_ce_data matches 1 run schedule function gm4_combat_expanded:weapon/modifier/delay/clock 1t
