# Revokes the breeding advancement and initiates baby tracking
# @s = player who bred livestock
# at @s
# run from advancement gm4_lavish_livestock:{{ entity_id }}/breed

advancement revoke @s only gm4_lavish_livestock:{{ entity_id }}/breed

# determine parent to inherit size from
scoreboard players set $parent_selected gm4_lavish_livestock_size -1
execute as @e[type={{ entity_id }},distance=..10,limit=2,sort=nearest,nbt=!{InLove:0}] run function gm4_lavish_livestock:{{ entity_id }}/determine_parent

# await birth
schedule function gm4_lavish_livestock:find_baby 1t
