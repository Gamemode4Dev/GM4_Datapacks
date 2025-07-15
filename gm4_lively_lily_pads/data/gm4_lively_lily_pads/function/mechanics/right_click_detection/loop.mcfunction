# loops as long as a "right click detection" interaction exists
# @s = arbitrary
# at unknown
# run from mechanics/right_click_detection/found and scheduled from self

# count down
scoreboard players remove $timer gm4_llp.data 1

execute as @e[type=interaction,tag=gm4_llp_placement_rcd] at @s run function gm4_lively_lily_pads:mechanics/right_click_detection/process

# loop if needed
execute if score $timer gm4_llp.data matches 0.. run schedule function gm4_lively_lily_pads:mechanics/right_click_detection/loop 10t
