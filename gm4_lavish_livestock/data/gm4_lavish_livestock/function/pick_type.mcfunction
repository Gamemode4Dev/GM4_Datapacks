# Selects babies near the breeding site
# @s = breeding site
# at @s
# run from gm4_lavish_livestock:find_baby

# cache parent size
scoreboard players operation $size gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute as @e[type=pig,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] run function gm4_lavish_livestock:modify_baby

# remove breeding site marker
kill @s
