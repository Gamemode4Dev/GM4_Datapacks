# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from weapon/modifier/delay/prime
# schedule from here

scoreboard players set $keep_tick.delay gm4_ce_keep_tick 0
execute as @e[tag=gm4_ce_delay_active] at @s run function gm4_combat_expanded:weapon/modifier/delay/tick
execute if score $keep_tick.delay gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/delay 10t
