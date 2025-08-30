# @s = interacted gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/interactions/candle/interact_rcd

# clean
data remove entity @s interaction

# fail if adventure
execute if score $adventure gm4_llp.data matches 1 run return run scoreboard players reset $adventure gm4_llp.data

# process
execute as @e[type=block_display,tag=gm4_llp_candle,distance=..0.1,limit=1] at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_display
