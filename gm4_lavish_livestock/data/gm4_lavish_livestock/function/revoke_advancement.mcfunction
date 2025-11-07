# Revokes the breeding advancement and initiates baby tracking
# @s = player who bred livestock
# at @s
# run from advancement gm4_lavish_livestock:breed

advancement revoke @s only gm4_lavish_livestock:breed

# determine parent to inherit size from
scoreboard players set $parent_selected gm4_lavish_livestock_data -1
execute as @e[type=pig,distance=..10,limit=2,sort=nearest,nbt=!{InLove:0}] run function gm4_lavish_livestock:determine_parent

# await birth
schedule function gm4_lavish_livestock:find_baby 1t
