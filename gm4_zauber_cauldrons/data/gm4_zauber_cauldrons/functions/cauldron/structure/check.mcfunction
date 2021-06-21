# @s = zauber cauldron
# at @s
# run from main

# analyze structure and set flags
execute store success score $has_cauldron gm4_zc_data if block ~ ~ ~ #minecraft:cauldrons
#tellraw @a ["",{"text":"[DEBUG] $has_cauldron=","color":"gray"},{"score":{"name":"$has_cauldron","objective":"gm4_zc_data"}}]
execute if score $has_cauldron gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/analyze/liquid
execute unless score $has_cauldron gm4_zc_data matches 1 run kill @s

# reset fake players
scoreboard players reset $has_cauldron gm4_zc_data
scoreboard players reset $has_liquid gm4_zc_data
scoreboard players reset $has_water gm4_zc_data
scoreboard players reset $has_powder_snow gm4_zc_data
scoreboard players reset $has_lava gm4_zc_data
scoreboard players reset $has_heatsource gm4_zc_data
scoreboard players reset $has_soul_fire_heatsource gm4_zc_data
