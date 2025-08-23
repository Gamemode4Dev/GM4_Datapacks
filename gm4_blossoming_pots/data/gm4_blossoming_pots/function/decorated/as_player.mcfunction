# Raycasts for pot the player interacted with, then proceeds if necessary
# @s = player who interacted with a decorated pot
# at @s
# run from advancement gm4_blossoming_pots:interact_with_decorated_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_decorated_pot

# run upgrade paths if needed
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:block_display,tag=rc_blossoming_pots.decorPotPlant0,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_decorated_pot
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:marker,tag=rc_blossoming_pots.flowerPot,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_flower_pot

# Reset temp
data remove storage gm4_blossoming_pots:decorated_pots temp

function gm4_blossoming_pots:decorated/get_player_rotation
# raycast
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes positioned ^ ^ ^ run function gm4_blossoming_pots:decorated/raycast
