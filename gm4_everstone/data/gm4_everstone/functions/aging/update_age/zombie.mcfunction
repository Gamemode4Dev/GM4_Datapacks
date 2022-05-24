# checks aging conditions of the mob
# @s = aging zombie
# located at @s
# run from aging/update_age/check_mob

# add age if in dry biome with direct sky access
execute unless block ~ ~ ~ water run scoreboard players add @s[predicate=gm4_everstone:in_dry_sunlight] gm4_es_age 1

# deplete age if not in dry biome with direct sky access
scoreboard players remove @s[predicate=!gm4_everstone:in_dry_sunlight,scores={gm4_es_age=1..}] gm4_es_age 1

# will take on average 30 minutes to convert
execute if score @s gm4_es_age matches 6.. run function gm4_everstone:aging/convert/husk
