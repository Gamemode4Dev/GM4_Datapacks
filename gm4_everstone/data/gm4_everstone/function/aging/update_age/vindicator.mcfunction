# checks aging conditions of the mob
# @s = aging vindicator
# located at @s
# run from aging/update_age/check_mob

# check how many nearby magical blocks there are
execute store result score @s gm4_es_data run clone ~-2 ~-1 ~-2 ~2 ~2 ~2 ~-2 ~-1 ~-2 filtered #gm4_everstone:contains_magic force

# if there are 7 or more magical blocks, increase the age
scoreboard players add @s[scores={gm4_es_data=7..}] gm4_es_age 1

# if there are no magical blocks, decrease the age
scoreboard players remove @s[scores={gm4_es_data=0}] gm4_es_age 1

# will take on average 1 hour to covert
execute if score @s gm4_es_age matches 12.. run function gm4_everstone:aging/convert/evoker
