# @s = tank with entity above it positioned ~ ~1 ~
# run from liquid_tanks:process via #gm4_liquid_tanks:util_above

tag @s add gm4_processing_tank

# shulker
execute as @e[dx=0,type=shulker,tag=!smithed.entity] run function gm4_potion_liquids:util/shulker

# witch
execute as @e[dx=0,type=witch,tag=!smithed.entity] run function gm4_potion_liquids:util/witch

tag @s remove gm4_processing_tank
