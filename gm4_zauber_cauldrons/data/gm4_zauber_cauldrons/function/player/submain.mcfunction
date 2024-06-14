# @s = non-spectator players
# at world spawn
# run from main

# check creation
execute at @s[gamemode=!adventure] if predicate gm4_zauber_cauldrons:player/equipment/enchanted_book/in_mainhand anchored eyes positioned ^ ^ ^1.448 align xyz unless entity @e[type=marker,tag=gm4_zauber_cauldron,dx=0] unless entity @e[tag=smithed.block,dx=0] run function gm4_zauber_cauldrons:cauldron/setup/validate_structure

# crystal effects
scoreboard players set $success gm4_zc_data 0
execute if predicate gm4_zauber_cauldrons:player/equipment/crystal/luck_and_in_offhand run function gm4_zauber_cauldrons:player/crystal/process
execute if score $success gm4_zc_data matches 0 if score @s gm4_zc_crystal matches 0..7 at @s run function gm4_zauber_cauldrons:player/crystal/deactivate


# reset fake player
scoreboard players reset $success
