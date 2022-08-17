# checks aging conditions of the mob
# @s = aging guardian
# located at @s
# run from aging/update_age/check_mob

# check how many nearby guardians there are
execute store result score @s gm4_es_data if entity @e[type=guardian,distance=..8,tag=!gm4_everstone_locked]

# if there are 5 other guardians and no elder guardians in a 32 block radius, increase the age
execute unless entity @e[type=elder_guardian,distance=..32,limit=1] run scoreboard players add @s[scores={gm4_es_data=6..}] gm4_es_age 1

# will take on average 2 hours to covert
execute if score @s gm4_es_age matches 24.. run function gm4_everstone:aging/convert/elder_guardian
