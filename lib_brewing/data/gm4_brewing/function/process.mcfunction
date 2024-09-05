# @s = brewing stand marker
# run from main

execute unless block ~ ~ ~ brewing_stand run kill @s

execute store result score @s gm4_brewing_data run data get block ~ ~ ~ BrewTime

execute if score @s gm4_brewing_data matches 1..18 run tag @s add gm4_brewing_tick
execute if score @s gm4_brewing_data matches 1..18 run schedule function gm4_brewing:check_brew 1t
