# run from aging/check_mob
# @s = aging guardian

# check how many nearby guardians there are
execute store result score @s gm4_es_data if entity @e[type=guardian,distance=..8,tag=!gm4_everstone_locked]

# if there are 5 other guardians, increase the age
tag @s[scores={gm4_es_data=6..}] add gm4_es_aging

# will take a minimum of 2 hours to covert
execute if score @s gm4_es_age matches 40.. run function gm4_everstone:convert/elder_guardian
