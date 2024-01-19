# hands handling of the interaction to expansions, or enforces default behavior if no expansion handles the liquid in question
# @s = cauldron that was emptied
# at position of cauldron, align xyz
# run from gm4_zauber_cauldrons:cauldron/liquid/update/level_3/reconstruct_interaction

# using any filled bucket on a cauldron will overwrite the currenlty contained liquid and fill the cauldron up fully.
kill @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1]

# check if an expansion handles this liquid type being added via bucket, which always overwrites the currenlty contained liquid.
# therefore in this the expansion only needs to provide a corrosponding item_display if necessary.
# expansions must set the fake player $interaction_intercepted in gm4_zc_data to 1 if they successfully handled the interaction.
# checking to see whether this flag was already set before intercepting an interaction is also recommended to prevent conflicts.
# the player who has interacted with the cauldron is tagged as gm4_zc_actor and their gamemode is available via the fake player
# $actor_gamemode in gm4_zc_data: 0 = survival or adventure, 1 = creative.
function #gm4_zauber_cauldrons:liquid/drain_bucket_into_cauldron

# if no expansion handled the liquid being inserted, fall back to vanilla bucket behavior and remove custom liquid, otherwise set liquid level to full
execute unless score $interaction_intercepted gm4_zc_data matches 1.. run scoreboard players reset @s gm4_zc_liquid_level
execute if score $interaction_intercepted gm4_zc_data matches 1.. run scoreboard players set @s gm4_zc_liquid_level 3

# reset fake player
scoreboard players reset $interaction_intercepted gm4_zc_data
