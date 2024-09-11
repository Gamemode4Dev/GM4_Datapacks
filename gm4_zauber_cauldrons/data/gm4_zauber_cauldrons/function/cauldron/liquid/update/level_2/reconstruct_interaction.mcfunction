# reconstruct in which way the player has interacted with the cauldron to get it into its minecraft:water_cauldron[level=2] state based on the previous state of the cauldron.
# @s = cauldron that was interacted with
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/level_2/ray

scoreboard players set $found gm4_zc_data 1

# check whether the player who caused the interaction was in creative or survival/adventure
execute as @a[tag=gm4_zc_actor,limit=1] store result score $actor_gamemode gm4_zc_data run function gm4_zauber_cauldrons:player/check_gamemode

# store fill level to fake player to enable easier access for expansions
# make sure the operation doesn't set @s's gm4_zc_liquid_level from NaN to 0
execute if score @s gm4_zc_liquid_level matches 1.. run scoreboard players operation $previous_fill_level gm4_zc_data = @s gm4_zc_liquid_level
scoreboard players add $previous_fill_level gm4_zc_data 0

# if the cauldron was at level=3 previously a glass bottle must have been used on the cauldron
execute if score $previous_fill_level gm4_zc_data matches 3 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_2/item_used/glass_bottle

# if the cauldron was at level=1 previously a water bottle must have been used on the cauldron
execute if score $previous_fill_level gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_2/item_used/water_bottle

# reset fake player
scoreboard players reset $actor_gamemode gm4_zc_data
scoreboard players reset $previous_fill_level gm4_zc_data
