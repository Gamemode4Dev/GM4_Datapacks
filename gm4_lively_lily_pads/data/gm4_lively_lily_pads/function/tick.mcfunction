# handles particles and light_block refeshing

schedule function gm4_lively_lily_pads:tick 8t

execute as @e[type=block_display,tag=gm4_llp_light] at @s run function gm4_lively_lily_pads:mechanics/particles/select_type
