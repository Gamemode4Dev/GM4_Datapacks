# @s = none
# run from process

scoreboard players set $brewed gm4_brewing_data 0
execute as @e[type=marker,tag=gm4_brewing_tick] at @s if block ~ ~ ~ brewing_stand{BrewTime:1s} run function gm4_brewing:prep_finish_brew

execute if score $brewed gm4_brewing_data matches 0 run schedule function gm4_brewing:check_brew 1t
