schedule function gm4_lively_lily_pads:tick 8t

# selects displays for particles, light_block refreshing, oxidization
execute as @e[type=block_display,tag=gm4_llp_light] at @s run function gm4_lively_lily_pads:mechanics/particles/select_type
