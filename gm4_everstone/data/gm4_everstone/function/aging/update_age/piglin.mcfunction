# checks aging conditions of the mob
# @s = aging piglin
# located at @s
# run from aging/update_age/check_mob

# count nearby piglin brutes
execute store result score @s gm4_es_data if entity @e[type=piglin_brute,distance=..32]

# add age if in a bastion remnant unless there are 3 other brutes nearby
scoreboard players add @s[predicate=gm4_everstone:in_bastion_remnant,scores={gm4_es_data=..2}] gm4_es_age 1

# deplete age if not in bastion remnant
scoreboard players remove @s[predicate=!gm4_everstone:in_bastion_remnant,scores={gm4_es_age=1..}] gm4_es_age 1

# will take on average 1 hour to convert
execute if score @s gm4_es_age matches 12.. run function gm4_everstone:aging/convert/piglin_brute
