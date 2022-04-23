# @s = player that clicked the sign, at the location of the sign
# run from the sign click event

tag @e[type=marker,tag=gm4_trapped_sign,limit=1,distance=..0.0001] add gm4_trapped_signs_need_pulse
