# Called once the parent has given birth and initiates breeding sites to look for babies.
# @s = undefined
# at undefined
# scheduled from gm4_lavish_livestock:{{ entity_id }}/revoke_advancement

execute as @e[type=marker,tag=gm4_lavish_livestock_breeding_site,tag=gm4_lavish_livestock_{{ entity_id }}] at @s run function gm4_lavish_livestock:{{ entity_id }}/find_baby
