# @s = punched gm4_llp_candle_rcd interaction
# at @s
# run from mechanics/attacks/candle/hit_rcd

# fail if different gametime
execute store result score $gametime gm4_llp.data run time query gametime
execute store result score $check_gametime gm4_llp.data run data get entity @s attack.timestamp 1
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return run data remove entity @s attack

# clean
data remove entity @s attack

# break candle
execute align xyz as @e[type=block_display,tag=gm4_llp_candle,dx=0,limit=1] at @s run function gm4_lively_lily_pads:mechanics/cleanup/kill

# reset creative score, was checked in mechanics/cleanup/kill
scoreboard players reset $creative gm4_llp.data
