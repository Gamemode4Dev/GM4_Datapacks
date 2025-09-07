# loops as long as a rcd interaction exists
# @s = unspecified
# at unspecified
# run from function: gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd and self

# reset scoreboard
scoreboard players remove $rcd_found gm4_rol_data 1

# execute as rcd
execute as @e[type=interaction,tag=gm4_rol_rcd_ladder] at @s run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/process

# loop
execute if score $rcd_found gm4_rol_data matches -9.. run schedule function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop 10t
