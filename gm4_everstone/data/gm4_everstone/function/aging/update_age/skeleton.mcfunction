# checks aging conditions of the mob
# @s = aging skeleton
# located at @s
# run from aging/update_age/check_mob

# stray conversion
## add age if in frozen biome with direct sky access
scoreboard players add @s[predicate=gm4_everstone:in_frozen_sunlight] gm4_es_age 1
## deplete age if not in frozen biome with direct sky access
scoreboard players remove @s[predicate=!gm4_everstone:in_frozen_sunlight,scores={gm4_es_age=1..}] gm4_es_age 1
## will take on average 30 minutes to convert
execute if score @s gm4_es_age matches 6.. run function gm4_everstone:aging/convert/stray

# bogged conversion
## add age if in a swamp biome in water
scoreboard players add @s[predicate=gm4_everstone:in_swampy_water] gm4_es_age_alt 1
## deplete age if not in swamp biome
scoreboard players remove @s[predicate=!gm4_everstone:in_swamp,scores={gm4_es_age_alt=1..}] gm4_es_age_alt 1
## will take on average 1 hour to convert
execute if score @s gm4_es_age_alt matches 12.. run function gm4_everstone:aging/convert/bogged
