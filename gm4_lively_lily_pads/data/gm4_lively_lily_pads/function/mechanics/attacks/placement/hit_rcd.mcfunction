# rcd hit, need to break rcd and lily pad
# @s = player who left clicked a placement rcd
# at @s
# run from advancement: punch_placement_rcd

advancement revoke @s only gm4_lively_lily_pads:punch_placement_rcd

# set creative flag
execute if entity @s[gamemode=creative] run scoreboard players set $creative gm4_llp.data 1

# process interaction
execute as @e[type=interaction,tag=gm4_llp_placement_rcd,distance=..8] if data entity @s attack at @s run function gm4_lively_lily_pads:mechanics/attacks/placement/process_interaction
