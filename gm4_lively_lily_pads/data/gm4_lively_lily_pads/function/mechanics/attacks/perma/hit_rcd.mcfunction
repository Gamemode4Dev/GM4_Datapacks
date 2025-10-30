# perma rcd hit, need to break
# @s = player who left clicked on a perma rcd
# at @s
# run from advancement: punch_perma_rcd

advancement revoke @s only gm4_lively_lily_pads:punch_perma_rcd

# set creative flag
execute if entity @s[gamemode=creative] run scoreboard players set $creative gm4_llp.data 1

# process attack
execute as @e[type=interaction,tag=gm4_llp_perma_rcd,distance=..8] if data entity @s attack at @s run function gm4_lively_lily_pads:mechanics/attacks/perma/process_interaction
