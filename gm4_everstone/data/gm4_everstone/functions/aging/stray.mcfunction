# run from aging/check_mob
# @s = aging stray

# add age if not in frozen biome=
tag @s[predicate=!gm4_everstone:in_frozen] add gm4_es_aging

# deplete age if in frozen biome
tag @s[predicate=gm4_everstone:in_frozen,scores={gm4_es_age=1..}] add gm4_es_deaging

# will take a minimum of 1 hour to convert
execute if score @s gm4_es_age matches 120.. run function gm4_everstone:convert/skeleton
