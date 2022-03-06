# @s = player
# at @s
# run from function: gm4_rope_ladders:main

# tag
tag @s remove gm4_rol_holding_ladder

# check if player is holding rope ladder
execute if predicate gm4_rope_ladders:holding_ladder run function gm4_rope_ladders:player/holding_ladder
