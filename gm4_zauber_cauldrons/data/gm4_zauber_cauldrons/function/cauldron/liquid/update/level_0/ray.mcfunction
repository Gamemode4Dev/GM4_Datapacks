# ray cast to find cauldron
# @s = player that used a bucket (or bottle) to empty a cauldron
# at @s anchored eyes positioned ^ ^ ^0.X where X = step count
# run from gm4_zauber_cauldrons:cauldron/liquid/update/level_0/find_cauldron

# check block
scoreboard players set $found gm4_zc_data 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #minecraft:cauldrons align xyz as @e[type=marker,tag=gm4_zauber_cauldron,dx=0,limit=1] run function gm4_zauber_cauldrons:cauldron/liquid/update/level_0/reconstruct_interaction

# runs the loop again
scoreboard players remove $ray gm4_zc_data 1
execute unless score $found gm4_zc_data matches 1 if score $ray gm4_zc_data matches 1.. positioned ^ ^ ^0.1 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_0/ray
