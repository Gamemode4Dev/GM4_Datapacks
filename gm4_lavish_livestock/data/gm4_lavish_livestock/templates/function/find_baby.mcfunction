# Selects babies near the breeding site
# @s = breeding site
# at @s
# run from gm4_lavish_livestock:{{ entity_id }}/find_marker

# cache parent size
scoreboard players operation $size gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute as @e[type={{ entity_id }},distance=..10,nbt={Age:-24000},limit=1,sort=nearest] run function gm4_lavish_livestock:{{ entity_id }}/modify_baby

# remove breeding site marker
kill @s
