# remove `response:1b` from gm4_llp_perma_rcd interactions
# @s = player
# at @s
# run via upgrade paths util

execute as @e[type=interaction,tag=gm4_llp_perma_rcd,nbt={response:1b}] run data modify entity @s response set value 0b
