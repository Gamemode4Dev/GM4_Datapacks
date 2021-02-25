# run from aging/check_mob
# @s = aging vindicator

# check how many nearby magical blocks there are
execute store result score @s gm4_es_data run clone ~-2 ~-1 ~-2 ~2 ~2 ~2 ~-2 ~-1 ~-2 filtered #gm4_everstone:contains_magic force

# if there are 7 or more magical blocks, increase the age
tag @s[scores={gm4_es_data=7..}] add gm4_es_aging

# if there are no magical blocks, decrease the age
tag @s[scores={gm4_es_data=0}] add gm4_es_deaging

# will take a minimum of 1 hour to covert
execute if score @s gm4_es_age matches 120.. run function gm4_everstone:convert/evoker
