# Raycasts for pot the player interacted with, then proceeds if necessary
# @s = player who interacted with an empty flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_with_flower_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_flower_pot

# run upgrade paths if needed
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:block_display,tag=rc_blossoming_pots.decorPotPlant0,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_decorated_pot
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:marker,tag=rc_blossoming_pots.flowerPot,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_flower_pot

# Reset temp & scoreboard signals
data remove storage gm4_blossoming_pots:flower_pots temp
scoreboard players set $signal_item_decr gm4_blossoming_pots.misc 0

function gm4_blossoming_pots:flower/get_player_data
# raycast
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes positioned ^ ^ ^ run function gm4_blossoming_pots:flower/raycast

# if signaled, decrement player mainhand (set in flower/prepare_data)
execute if score $signal_item_decr gm4_blossoming_pots.misc matches 1 if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand gm4_blossoming_pots:count_decr

# if signaled, give item back to player (set in flower/remove_plant)
execute if score $signal_give_back gm4_blossoming_pots.misc matches 1 run function gm4_blossoming_pots:flower/give_item_to_player with storage gm4_blossoming_pots:flower_pots temp.perma_marker_data
