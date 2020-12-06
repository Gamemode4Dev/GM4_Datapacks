# run from aging/check_mob
# @s = aging piglin

# count nearby piglin brutes
execute store result score @s gm4_es_data if entity @e[type=piglin_brute,distance=..32]

# add age if in a bastion remnant unless there are 3 other brutes nearby
tag @s[predicate=gm4_everstone:in_bastion_remnant,scores={gm4_es_data=..2}] add gm4_es_aging

# deplete age if not in bastion remnant
tag @s[predicate=!gm4_everstone:in_bastion_remnant,scores={gm4_es_age=1..}] add gm4_es_deaging

# will take a minimum of 1 hour to convert
execute if score @s gm4_es_age matches 120.. run function gm4_everstone:convert/piglin_brute
