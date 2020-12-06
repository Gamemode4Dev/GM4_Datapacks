# run from aging/check_mob
# @s = aging slime

# add age if in the nether
tag @s[predicate=gm4_everstone:in_nether] add gm4_es_aging

# deplete age if not in the nether
tag @s[predicate=!gm4_everstone:in_nether,scores={gm4_es_age=1..}] add gm4_es_deaging

# will take a minimum of 30 min to convert
execute if score @s gm4_es_age matches 60.. run function gm4_everstone:convert/magma_cube
