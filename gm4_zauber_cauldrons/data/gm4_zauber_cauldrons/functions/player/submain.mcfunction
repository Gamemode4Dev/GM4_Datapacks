# @s = non-spectator players
# at world spawn
# run from main

# check creation
execute at @s[gamemode=!adventure] if predicate gm4_zauber_cauldrons:player/equipment/enchanted_book/in_mainhand anchored eyes positioned ^ ^ ^1.448 align xyz positioned ~.5 ~.5 ~.5 unless entity @e[type=marker,tag=gm4_zauber_cauldron,distance=..0.5] unless entity @e[tag=smithed.block,distance=..0.5] run function gm4_zauber_cauldrons:cauldron/setup/validate_structure

# crystal effects
scoreboard players set $success gm4_zc_data 0
execute if predicate gm4_zauber_cauldrons:player/equipment/crystal/luck_and_in_offhand run function gm4_zauber_cauldrons:player/crystal/process
execute if score $success gm4_zc_data matches 0 if score @s gm4_zc_crystal matches 0..7 at @s run function gm4_zauber_cauldrons:player/crystal/deactivate

# effect players with luck when they crafted it using flowers and remove tag after death
tag @s[scores={gm4_zc_deaths=1..}] remove gm4_zc_luck
scoreboard players reset @s gm4_zc_deaths
effect give @s[tag=gm4_zc_luck] minecraft:luck 12 0 true

# reset fake player
scoreboard players reset $success
