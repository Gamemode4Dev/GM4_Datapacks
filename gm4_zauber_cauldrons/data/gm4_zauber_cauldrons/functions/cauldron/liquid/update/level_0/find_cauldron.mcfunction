# initiates a raycast to locate a zauber cauldron which was set to level=0 (minecraft:cauldron) by a player
# @s = player who has interacted with the cauldron. May be survival or creative and may have used the offhand or the mainhand.
# at @s
# run from advancement cauldron/level_0

advancement revoke @s only gm4_zauber_cauldrons:cauldron/level_0

# remember player who has interacted with the cauldron
tag @s add gm4_zc_actor

# find cauldron that was interacted with
scoreboard players set $ray gm4_zc_data 50
scoreboard players set $found gm4_zc_data 0
execute anchored eyes positioned ^ ^ ^ run function gm4_zauber_cauldrons:cauldron/liquid/update/level_0/ray

# remove tag
tag @s remove gm4_zc_actor

# reset fake players
scoreboard players reset $ray gm4_zc_data
scoreboard players reset $found gm4_zc_data
