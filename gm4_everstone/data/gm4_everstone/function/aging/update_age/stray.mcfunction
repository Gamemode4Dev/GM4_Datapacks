# checks aging conditions of the mob
# @s = aging stray
# located at @s
# run from aging/update_age/check_mob

# add age if not in frozen biome
scoreboard players add @s[predicate=!gm4_everstone:in_frozen] gm4_es_age 1

# deplete age if in frozen biome
scoreboard players remove @s[predicate=gm4_everstone:in_frozen,scores={gm4_es_age=1..}] gm4_es_age 1

# will take on average 1 hour to convert
execute if score @s gm4_es_age matches 12.. run function gm4_everstone:aging/convert/skeleton
