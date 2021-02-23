# @s = player who's picked up a soul fragment
# from intake_fragment

scoreboard players remove @s gm4_sf_fragments 1

attribute @s minecraft:generic.max_health modifier remove c93b8492-66c8-40bf-ad0e-cd8405099aa8

function gm4_soul_fragments:player/update_health
