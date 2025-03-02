# Prevent a player putting an item from potable_pots tag list into a pot that already has a blossoming pots block display
# @s = player who interacted with a filled vanilla flower pot
# at @s
# run from advancement gm4_blossoming_pots:interact_with_vanilla_flower_pot

# Reset advancement
advancement revoke @s only gm4_blossoming_pots:interact_with_vanilla_flower_pot

# run upgrade paths if needed
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:block_display,tag=rc_blossoming_pots.decorPotPlant0,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_decorated_pot
execute if score blossoming_pots gm4_earliest_version matches 0 \
    as @e[type=minecraft:marker,tag=rc_blossoming_pots.flowerPot,distance=..10] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_flower_pot

# Reset temp
data remove storage gm4_blossoming_pots:flower_pots temp

# Raycast for the pot (set up range and search) and proceed if needed
execute store result score @s gm4_blossoming_pots.range run attribute @s minecraft:block_interaction_range get 200
execute anchored eyes positioned ^ ^ ^ run function gm4_blossoming_pots:vanilla_pot_handling/raycast

# if signaled (set in vanilla_pot_handling/as_marker), summon item at player to give it back to them
execute if score $signal_give_back gm4_blossoming_pots.misc matches 1 if entity @s[gamemode=!creative] run function gm4_blossoming_pots:vanilla_pot_handling/give_item_back with storage gm4_blossoming_pots:flower_pots temp
