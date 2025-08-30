# @s = punched gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/attacks/candle/hit_rcd

# clean
data remove entity @s attack

# fail if adventure
execute if score $adventure gm4_llp.data matches 1 run return run scoreboard players reset $adventure gm4_llp.data

# break candle
execute as @e[type=block_display,tag=gm4_llp_candle,distance=..0.1,limit=1] run function gm4_lively_lily_pads:mechanics/cleanup/kill

# reset creative score, was checked in mechanics/cleanup/kill
scoreboard players reset $creative gm4_llp.data
