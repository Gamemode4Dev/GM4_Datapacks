# increments perma markers count and sets full tag if count has reached the maximum
# @s = perma marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/prepare_data

execute store result score @s gm4_blossoming_pots.loop \
    run data get entity @s data.count 1
scoreboard players add @s gm4_blossoming_pots.loop 1
execute store result entity @s data.count int 1 \
    run scoreboard players get @s gm4_blossoming_pots.loop

# set full if full, using new count
function gm4_blossoming_pots:flower/set_full with entity @s data
