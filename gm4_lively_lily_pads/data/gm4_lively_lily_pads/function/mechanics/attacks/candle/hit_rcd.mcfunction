# candle hit, need to break
# @s = player who left clicked on a candle
# at @s
# run from advancement: punch_candle_rcd

advancement revoke @s only gm4_lively_lily_pads:punch_candle_rcd

# check gamemode
execute if entity @s[gamemode=adventure] run return fail
execute if entity @s[gamemode=creative] run scoreboard players set $creative gm4_llp.data 1

# process interaction
execute as @e[type=interaction,tag=gm4_llp_candle_rcd,distance=..8] if data entity @s attack at @s run function gm4_lively_lily_pads:mechanics/attacks/candle/process_interaction
