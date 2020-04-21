# @s = non-spectator players
# at world spawn
# run from main

# check creation
execute if predicate gm4_zauber_cauldrons:player/equipment/enchanted_book/in_mainhand at @s unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,distance=..2] anchored eyes positioned ^ ^ ^1.448 align xyz positioned ~.5 ~.5 ~.5 if block ~ ~ ~ cauldron unless block ~ ~ ~ cauldron[level=0] if block ~ ~-1 ~ fire run function gm4_zauber_cauldrons:cauldron/create

# effect players with luck when they crafted it using flowers and remove tag after death
tag @s[scores={gm4_zc_deaths=1..}] remove gm4_zc_luck
scoreboard players reset @s gm4_zc_deaths
effect give @s[tag=gm4_zc_luck] minecraft:luck 8 0 true
