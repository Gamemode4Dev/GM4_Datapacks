# @s = non-spectator players
# at world spawn
# run from main

# check creation
execute at @s[gamemode=!adventure] if predicate gm4_zauber_cauldrons:player/equipment/enchanted_book/in_mainhand anchored eyes positioned ^ ^ ^1.448 align xyz unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,dx=0] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:cauldron/setup/validate_structure

# effect players with luck when they crafted it using flowers and remove tag after death
tag @s[scores={gm4_zc_deaths=1..}] remove gm4_zc_luck
scoreboard players reset @s gm4_zc_deaths
effect give @s[tag=gm4_zc_luck] minecraft:luck 12 0 true
