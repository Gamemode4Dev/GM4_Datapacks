# Increments perma markers count and check-and-sets full tag
# @s = perma marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/prepare_data

execute store result score @s gm4_blossoming_pots.loop \
    run data get entity @s data.gm4_blossoming_pots.count 1
scoreboard players add @s gm4_blossoming_pots.loop 1
execute store result storage gm4_blossoming_pots:flower_pots temp.count int 1 \
    store result entity @s data.gm4_blossoming_pots.count int 1 \
    run scoreboard players get @s gm4_blossoming_pots.loop

# set full if full, using new count
function gm4_blossoming_pots:flower/set_full with entity @s data.gm4_blossoming_pots
