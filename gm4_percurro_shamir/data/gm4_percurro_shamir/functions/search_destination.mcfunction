# @s = player hitting a mob with a percurro shamir
# at @s
# run from advancement gm4_percurro_shamir:use

# place temporary departion marker
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["gm4_percurro_depart"],Duration:1,Particle:"block air"}

# search for valid destination and teleport
execute positioned ^ ^ ^4 run function gm4_percurro_shamir:check_teleport_destination/y_0

# visuals
particle minecraft:campfire_cosy_smoke ~ ~ ~ .1 1 .1 0.03 20

# revoke advancement
advancement revoke @s only gm4_percurro_shamir:use
