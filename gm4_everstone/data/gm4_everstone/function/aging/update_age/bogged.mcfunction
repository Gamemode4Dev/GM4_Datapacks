# checks aging conditions of the mob
# @s = aging bogged
# located at @s
# run from aging/update_age/check_mob

# add age if sheared and not in swamp biome
scoreboard players add @s[predicate=gm4_everstone:sheared_and_out_of_swamp] gm4_es_age 1

# deplete age if in swamp biome
scoreboard players remove @s[predicate=gm4_everstone:in_swamp,scores={gm4_es_age=1..}] gm4_es_age 1

# will take on average 1 hour to convert
execute if score @s gm4_es_age matches 12.. run function gm4_everstone:aging/convert/skeleton
