# @s = none
# run from process

execute as @e[type=marker,tag=gm4_brewing_tick] at @s if block ~ ~ ~ brewing_stand{BrewTime:1s} run function gm4_brewing-1.0:prep_finish_brew

execute if entity @e[type=marker,tag=gm4_brewing_tick,limit=1] run schedule function gm4_brewing-1.0:check_brew 1t
