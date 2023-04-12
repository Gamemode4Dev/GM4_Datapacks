# raycast down until growth is done or goes out of range
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/init
# run from here

# TODO: check list
execute if block ~ ~ ~ #gm4_hydromancy:heal_spell_growable run function gm4_hydromancy:spell_trident/heal/grow/check_type
particle rain ~ ~-0.45 ~ 0.45 0.45 0.45 0 12

execute if score $heal.growth_done gm4_hy_data matches 0 align y positioned ~ ~-0.05 ~ if entity @e[type=trident,tag=gm4_hy_target,distance=..8] run function gm4_hydromancy:spell_trident/heal/grow/raycast
