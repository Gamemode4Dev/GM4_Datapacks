# @s = metachunk_init that is a candidate to become the initialized metachunk
# run from main

# if there already is an initialized metachunk, kill itself, otherwise initialize
execute store success score #success gm4_count positioned ~-24 -1 ~-24 if entity @e[type=marker,tag=gm4_metachunk,tag=!gm4_metachunk_init,dx=47,dy=1,dz=47]

execute if score #success gm4_count matches 1 run kill @s
execute if score #success gm4_count matches 0 run function gm4_orbis:metachunk/init
