# loops as long as a "right click detection" villager exists
# run from function: gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd

# reset scoreboard
scoreboard players remove $rcd_found gm4_rol_data 1

# execute as rcd
execute as @e[type=villager,tag=gm4_rol_rcd_ladder,tag=gm4_rol_rcd] at @s store success score $rcd_found gm4_rol_data run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/process

# loop
execute if score $rcd_found gm4_rol_data matches -9.. run schedule function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop 10t
