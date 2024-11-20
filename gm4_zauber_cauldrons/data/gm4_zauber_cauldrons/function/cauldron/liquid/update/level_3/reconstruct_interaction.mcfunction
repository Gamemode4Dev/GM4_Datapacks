# reconstruct in which way the player has interacted with the cauldron to get it into its minecraft:water_cauldron[level=3], minecraft:lava_cauldron, or minecraft:powder_snow_cauldron state based on the previous state of the cauldron.
# @s = cauldron that was interacted with
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/level_3/ray

scoreboard players set $found gm4_zc_data 1

# check whether the player who caused the interaction was in creative or survival/adventure
execute as @a[tag=gm4_zc_actor,limit=1] store result score $actor_gamemode gm4_zc_data run function gm4_zauber_cauldrons:player/check_gamemode

# store fill level to fake player to enable easier access for expansions
# make sure the operation doesn't set @s's gm4_zc_liquid_level from NaN to 0
execute if score @s gm4_zc_liquid_level matches 1.. run scoreboard players operation $previous_fill_level gm4_zc_data = @s gm4_zc_liquid_level
scoreboard players add $previous_fill_level gm4_zc_data 0

# if the cauldron was at level=NaN, level=1, or at level=3 previously some filled bucket must have been used on the cauldron
execute unless score $previous_fill_level gm4_zc_data matches 2 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/item_used/filled_bucket

# in the case that the cauldron was previously at level=2 we can not distinguish between the use of a bucket or the use of a water bottle
# without looking at the player's inventory (and even then there is a case in which we can not tell)
execute if score $previous_fill_level gm4_zc_data matches 2 as @a[tag=gm4_zc_actor,limit=1] run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/analyze_held_items/select_gamemode
execute if score $item_use_code gm4_zc_data matches 0..1 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/item_used/filled_bucket
execute if score $item_use_code gm4_zc_data matches 2..3 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/item_used/water_bottle

# reset fake player
scoreboard players reset $actor_gamemode gm4_zc_data
scoreboard players reset $previous_fill_level gm4_zc_data
scoreboard players reset $item_use_code gm4_zc_data
