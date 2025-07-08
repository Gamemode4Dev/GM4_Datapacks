# loops as long as a "right click detection" interaction exists
# run from mechanics/right_click_detection/found
# scheduled from self

# reset scoreboard
scoreboard players remove $timer gm4_llp.data 1

# execute as rcd
execute as @e[type=interaction,tag=gm4_llp_placement_rcd] at @s run function gm4_lively_lily_pads:mechanics/right_click_detection/process

# loop
execute if score $timer gm4_llp.data matches 0.. run schedule function gm4_lively_lily_pads:mechanics/right_click_detection/loop 10t
