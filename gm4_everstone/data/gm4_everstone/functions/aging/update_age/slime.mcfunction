# checks aging conditions of the mob
# @s = aging slime
# located at @s
# run from aging/update_age/check_mob

# add age if in the nether
scoreboard players add @s[predicate=gm4_everstone:in_nether] gm4_es_age 1

# deplete age if not in the nether
scoreboard players remove @s[predicate=!gm4_everstone:in_nether,scores={gm4_es_age=1..}] gm4_es_age 1

# will take on average 30 minutes to convert
execute if score @s gm4_es_age matches 6.. run function gm4_everstone:aging/convert/magma_cube
